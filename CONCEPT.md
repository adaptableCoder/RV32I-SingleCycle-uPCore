# RISC-V RV32I Single-Cycle Processor: Core Concepts & Hardware Mapping

This document breaks down the fundamental theory of the RISC-V (Reduced Instruction Set Computer) architecture and explains exactly how those concepts map to the physical SystemVerilog digital logic.

---

## 1. What is RV32I?
**RV32I** stands for **R**ISC-**V**, **32**-bit integer base instruction set.
In the hardware world, this tells the physical dimensions of the entire processor:
* **32-bit Registers:** The `register_file` has 32 storage buckets, each exactly 32 bits wide.
* **32-bit Data Highways:** The internal wires routing data between chips are all `logic [31:0]`.
* **32-bit Instructions:** Every command given to the CPU is exactly 32 bits (4 bytes) long.

---

## 2. The Instruction:
The processor does not understand Assembly language (like `add x1, x2, x3`). It only reads a 32-bit binary number from the `instruction_memory`. 

To make sense of these 32 bits, the hardware relies on the **Control Unit** to slice the binary into specific fields:
* **Opcode (Bits [6:0]):** The bottom 7 bits are the most important. They tell the `control_unit` what *type* of instruction this is (e.g., an ALU math operation, a Memory load, or a Branch).
* **Registers (`rs1`, `rs2`, `rd`):** These 5-bit chunks point to specific addresses in the `register_file`. $2^5 = 32$, which is exactly why there are 32 registers.
* **Immediate:** A hardcoded constant number embedded directly inside the instruction. The `immediate_generator` extracts these scattered bits and pieces them together into a usable 32-bit number.

---

## 3. The 5 Conceptual Stages of Execution
Even though this is a **Single-Cycle** processor (meaning the entire instruction finishes in one clock tick), the electrical signals physically flow through five distinct stages. 

### Stage 1: Fetch
* **Concept:** The CPU needs to know what to do next.
* **Hardware:** The `program_counter` (PC) holds the current memory address. It sends this address to the `instruction_memory` (ROM), which spits out the raw 32-bit instruction.

### Stage 2: Decode
* **Concept:** The CPU translates the instruction and gathers the required data.
* **Hardware:** * The `control_unit` reads the Opcode and flips all the multiplexer switches (`pc_src`, `alu_src1`, etc.) to set up the datapath.
    * The `register_file` reads the addresses for `rs1` and `rs2` and asynchronously outputs `data1` and `data2`.

### Stage 3: Execute
* **Concept:** The CPU performs the actual math or logical operation.
* **Hardware:** The `alu` (Arithmetic Logic Unit) does the heavy lifting. The `alu_control_unit` tells it exactly what math to do (ADD, SUB, AND, XOR) based on the Opcode and `func3` bits.

### Stage 4: Memory
* **Concept:** If the instruction is a Load or Store, the CPU interacts with the RAM.
* **Hardware:** The `data_memory` module uses the math calculated by the ALU as its physical address. If `mem_read` is high, it pulls data out. If `mem_write` is high, it saves `data2` into the RAM.

### Stage 5: Writeback
* **Concept:** The final result is saved back into the CPU's local storage.
* **Hardware:** A multiplexer (`mem_reg_mux`) chooses whether the data coming from the ALU or the Data Memory gets routed back to the `register_file` to be saved on the next clock edge.

---

## 4. Hardware Routing: Multiplexers and Multiplexing
A processor cannot physically build a separate datapath for every single instruction, it would take up too much silicon. Instead, it uses **Multiplexers** to share hardware. 

### The "Base + Offset" Concept (ALU Sources)
Many instructions require the ALU to calculate an address or a new value by adding a variable to a constant (e.g., `lw`, `sw`, `addi`, `auipc`).
* **Operand 1:** Usually the Base Address (from the Register File).
* **Operand 2:** Usually the Offset/Constant (from the Immediate Generator).

In the top-level SystemVerilog code, multiplexers route these exact signals based on the Control Unit's decisions:
```systemverilog
// If alu_src1 is 1, use the PC. If 0, use the base register (data1).
assign operand1 = alu_src1 ? pc : data1; 

// If alu_src2 is 1, use the Immediate offset. If 0, use the second register (data2).
assign operand2 = alu_src2 ? immediate : data2;
```

## 5. The RISC Philosophy: Hardwired vs. Microcoded Control
The defining feature of a **Reduced** Instruction Set Computer (RISC) is how it decodes instructions, which heavily influenced the SystemVerilog design of this core.

### Hardwired Control (The RISC-V Way)
Because every RISC-V instruction is exactly 32 bits long and the Opcode is always in the exact same location (bits `[6:0]`), the CPU does not have to "think" about how to read it. 
In the SystemVerilog code, this is implemented as a massive `case(opcode)` block inside an `always_comb` module. 
* **The Hardware Reality:** When synthesized, this `case` statement becomes a physical, hardwired web of AND/OR logic gates (a Decoder). 
* **The Result:** The moment an instruction hits this decoder, electricity flows through the gates instantly, flipping all 11 multiplexer switches across the datapath in a single clock cycle. It is incredibly fast and takes up very little physical silicon.

### Microcoded Control (The CISC Alternative)
For contrast, Complex Instruction Set Computers (like Intel x86) have variable-length instructions (1 to 15 bytes long) where the opcodes constantly move around. 
* **The Hardware Reality:** Building a hardwired combinational decoder for x86 is nearly impossible. Instead, CISC processors use a hidden internal ROM memory. 
* **The Result:** When an x86 chip receives an instruction, it has to look up a "micro-program" inside that ROM and execute it over multiple clock cycles just to figure out how to set its multiplexers. 

By utilizing hardwired control, this RV32I core trades software complexity for raw, uncompromising hardware speed.

## 6. Instruction Formats (6) of RISC-V:
To keep the hardware simple, RISC-V enforces strict rules on where certain bits live inside the 32-bit instruction. For example, the destination register (`rd`) is **always** located at bits `[11:7]`, regardless of the instruction. 

However, because different operations need different types of data, the ISA defines six fundamental instruction "shapes" or types.

| Type | Category | Layout Concept | Example | Hardware Purpose |
| :--- | :--- | :--- | :--- | :--- |
| **R-Type** | Register | Uses 3 registers (`rs1`, `rs2`, `rd`). No immediate value. | `add rd, rs1, rs2` | Pure ALU math or logic between existing variables. |
| **I-Type** | Immediate | Uses 2 registers (`rs1`, `rd`) and a 12-bit constant. | `addi rd, rs1, imm` | Math with constants, or loading data from memory (`lw`). |
| **S-Type** | Store | Uses 2 registers (`rs1`, `rs2`) and a 12-bit constant. No `rd`. | `sw rs2, imm(rs1)` | Writing to memory. The Immediate is split into two chunks to keep `rs1` and `rs2` in standard positions. |
| **B-Type** | Branch | Similar to S-Type, but the Immediate is scrambled. | `beq rs1, rs2, imm` | Conditional jumps (If/Else). The hardware scrambles the immediate bits to map directly to the PC Adder efficiently. |
| **U-Type** | Upper Imm. | Uses 1 register (`rd`) and a massive 20-bit constant. | `lui rd, imm` | Loading large memory addresses or numbers that don't fit in 12 bits. |
| **J-Type** | Jump | Uses 1 register (`rd`) and a scrambled 20-bit constant. | `jal rd, imm` | Unconditional jumps (Function calls). Saves the return address in `rd`. |

---

## 7. The Supported Instruction Set
Based on the hardwired Control Unit and ALU decoders built in this SystemVerilog implementation, this specific RV32I core can execute the following fundamental operations:

### Arithmetic & Logical Operations (The "Math")
Executed entirely within the Datapath using the ALU and Register File.
* **`add` / `sub` (R-Type):** Standard addition and subtraction between two registers.
* **`and` / `or` / `xor` (R-Type):** Bitwise logic operations used for masking and data manipulation.
* **`sll` / `srl` / `sra` (R-Type):** Bit-shifting (Logical Left/Right, Arithmetic Right). This is how the hardware performs fast multiplication/division by powers of 2.
* **`addi` / `andi` / `ori` (I-Type):** The immediate versions of the math above, adding a hardcoded constant to a register.

### Memory Access (The "RAM")
The only instructions permitted to talk to the Data Memory, utilizing the "Base + Offset" addressing method.
* **`lw` (Load Word - I-Type):** Reads a 32-bit chunk of data from RAM and saves it into the Register File.
* **`sw` (Store Word - S-Type):** Takes a 32-bit variable from the Register File and overwrites a specific address in RAM.

### Control Flow (The "Decision Makers")
These instructions manipulate the Program Counter (PC) to break out of sequential execution, enabling loops and functions.
* **`beq` / `bne` (Branch - B-Type):** "Branch if Equal" or "Branch if Not Equal". The ALU subtracts `rs1` from `rs2`. If the result is zero, the Branch flag triggers, and the PC jumps to the target address.
* **`jal` (Jump and Link - J-Type):** Unconditionally jumps to a new PC address (useful for calling a function) and links (saves) the return address (`PC + 4`) into the Register File so the program knows how to get back.
* **`jalr` (Jump and Link Register - I-Type):** Similar to `jal`, but jumps to an absolute address currently stored inside a register, rather than an offset.

### Constant Manipulation
* **`lui` (Load Upper Immediate - U-Type):** Forces a 20-bit constant directly into the top 20 bits of a register, filling the bottom 12 bits with zeros. Used alongside `addi` to build massive 32-bit constants.
* **`auipc` (Add Upper Immediate to PC - U-Type):** Adds a 20-bit constant to the current Program Counter and saves the result in a register. Highly utilized in modern OS-level position-independent code.