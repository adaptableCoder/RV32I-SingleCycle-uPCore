module alu (
  input [31:0] operand1,
  input [31:0] operand2,
  input [3:0] opcode,
  output logic [31:0] result
);
  always_comb begin
    case (opcode)
      4'b0000: result = operand1 + operand2; // ADD
      4'b0001: result = operand1 - operand2; // SUB
      4'b0010: result = operand1 & operand2; // AND
      4'b0011: result = operand1 | operand2; // OR
      4'b0100: result = operand1 ^ operand2; // XOR
      4'b0101: result = $signed(operand1) < $signed(operand2) ? 32'b1 : 32'b0; // SLT
      4'b0110: result = operand1 < operand2 ? 32'b1 : 32'b0; // SLTU
      4'b0111: result = operand1 << operand2[4:0]; // SLL
      4'b1000: result = operand1 >> operand2[4:0]; // SRL
      4'b1001: result = $signed(operand1) >>> operand2[4:0]; // SRA
      4'b1010: result = (operand1 == operand2) ? 32'b1 : 32'b0; // BEQ
      4'b1011: result = (operand1 != operand2) ? 32'b1 : 32'b0; // BNE
      4'b1100: result = $signed(operand1) < $signed(operand2) ? 32'b1 : 32'b0; // BLT
      4'b1101: result = $signed(operand1) >= $signed(operand2) ? 32'b1 : 32'b0; // BGE
      4'b1110: result = operand1 < operand2 ? 32'b1 : 32'b0; // BLTU
      4'b1111: result = operand1 >= operand2 ? 32'b1 : 32'b0; // BGEU
      default: result = 32'bxxxxxxxx; // XXXXXXXX 
    endcase
  end
endmodule