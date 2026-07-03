module alu_control_unit (
  input logic [2:0] alu_op,         // From Main Control Unit
  input logic [2:0] func3,          // Inst[14:12]
  input logic bit30,                // Inst[30]
  output logic [3:0] alu_control    // To ALU
);
  always_comb begin
    case(alu_op)
      // Memory Operations
      3'b000: alu_control = 4'b0000;

      // Branch Instructions
      3'b001: begin
        case(func3)
          3'b000: alu_control = 4'b1010; // BEQ
          3'b001: alu_control = 4'b1011; // BNE
          3'b100: alu_control = 4'b1100; // BLT
          3'b101: alu_control = 4'b1101; // BGE
          3'b110: alu_control = 4'b1110; // BLTU
          3'b111: alu_control = 4'b1111; // BGEU
          default: alu_control = 4'bxxxx;
        endcase
      end

      // R-type, I-type Instructions
      3'b010, 3'b011: begin
        case(func3)
          3'b000: alu_control = (alu_op == 3'b010 && bit30) ? 4'b0001 : 4'b0000; // R-type: SUB, ADD | I-type: ADDI
          3'b001: alu_control = 4'b0111; // SLL | SLLI
          3'b100: alu_control = 4'b0100; // XOR | XORI
          3'b101: alu_control = bit30 ? 4'b1001 : 4'b1000; // SRA, SRL | SRAI, SRLI
          3'b110: alu_control = 4'b0011; // OR | ORI
          3'b111: alu_control = 4'b0010; // AND | ANDI
          default: alu_control = 4'bxxxx;
        endcase
      end

      default: alu_control = 4'bxxxx;
    endcase
  end
endmodule