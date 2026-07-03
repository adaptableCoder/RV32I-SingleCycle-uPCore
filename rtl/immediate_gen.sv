module immediate_generator(
  input [31:0] instruction,
  output logic [31:0] immediate
);
  always_comb begin
    case(instruction[6:0])
      7'b0000011, 7'b0010011, 7'b1100111: // Load, I-Type, JALR
        immediate = {{20{instruction[31]}}, instruction[31:20]};
      7'b0100011: // S-Type
        immediate = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
      7'b1100011: // B-Type
        immediate = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
      7'b1101111: // J-Type: JAL (Jump and Link)
        immediate = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
      7'b0110111, 7'b0010111: // U-Type: LUI, AUIPC
        immediate = {instruction[31:12], 12'b0};
      default: // R-type (don't use immediate)
        immediate = 32'b0; 
    endcase
  end
endmodule

/* IMMEDIATE GENERATOR
   It is a combinational logic block that extracts constant values (immediates) embedded directly inside the 32-bit instruction word.
   It is used to save memory and execution time, RISC-V avoids loading small constants from data memory. Instead, it packs them right into the instruction itself. Because instruction bits are limited, these immediate values are often chopped up and scattered across the 32-bit word depending on the format type.
   The Immediate Generator's job is to look at the instruction, stitch those scattered bits back together in the correct order, and sign-extend them into a standard 32-bit integer so the ALU can actually perform math with it.
 */