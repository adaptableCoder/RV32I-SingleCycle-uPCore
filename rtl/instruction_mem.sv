module instruction_memory (
  input logic [31:0] read_address,  // from PC
  output logic [31:0] instruction   // raw 32 bit instruction
);
  logic [31:0] rom [0:1023];
  
  assign instruction = rom[read_address[31:2]]; // last 2 bits dropped to divide by 4

  initial begin
    $readmemh("testbench/program.hex", rom);
  end
endmodule

/* 
  INSTRUCTION MEMORY (ROM)
   It is a read-only memory block that holds the compiled RISC-V program.

   Byte-Addressing: RISC-V addresses memory by the byte, but instructions are 32 bits (4 bytes) wide. Therefore, the Program Counter increments by 4 (0, 4, 8, 12...). 
   To map this to a standard Verilog array index (0, 1, 2, 3...), the read_address is divided by 4.
*/