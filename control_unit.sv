module control_unit (
  input  logic [6:0] opcode,

  output logic lui,
  output logic PcSrc,
  output logic MemRead,
  output logic MemWrite,
  output logic [2:0] AluOp,
  output logic MemToReg,
  output logic AluSrc2,
  output logic AluSrc1,
  output logic RegWrite,
  output logic Jump,
  output logic Branch
);
  always_comb begin
    // Default all signals to 0 to prevent latches
    lui = 1'b0;
    PcSrc = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    AluOp = 3'b000;
    MemToReg = 1'b0;
    AluSrc2 = 1'b0;
    AluSrc1 = 1'b0;
    RegWrite = 1'b0;
    Jump = 1'b0;
    Branch = 1'b0;

    case (opcode)
      // R-Type (add, sub, and, etc.)
      7'b0110011: begin
        RegWrite = 1'b1;
        AluOp = 3'b010;
      end

      // I-Type ALU (addi, slli, etc.)
      7'b0010011: begin
        RegWrite = 1'b1;
        AluSrc2 = 1'b1;
        AluOp = 3'b011;
      end
      
      // Load (lw)
      7'b0000011: begin
        MemRead = 1'b1;
        AluOp = 3'b000;
        MemToReg = 1'b1;
        AluSrc2 = 1'b1;
        RegWrite = 1'b1;
      end
      
      // Store (sw)
      7'b0100011: begin
        MemWrite = 1'b1;
        AluSrc2 = 1'b1;
        AluOp = 3'b000;
      end
      
      // Branch (beq, bne, etc.)
      7'b1100011: begin
        Branch = 1'b1;
        AluOp = 3'b001;
      end
      
      // LUI
      7'b0110111: begin
        lui = 1'b1;
        RegWrite = 1'b1;
        AluSrc2 = 1'b1;
        AluOp = 3'b000;
      end
      
      // AUIPC
      7'b0010111: begin
        lui = 1'b0;
        AluSrc1 = 1'b1;  // Route PC to ALU
        AluSrc2 = 1'b1;  // Route Imm to ALU
        RegWrite = 1'b1;
        AluOp = 3'b000;
      end
      
      // JAL
      7'b1101111: begin
        Jump = 1'b1;
      end
      
      // JALR
      7'b1100111: begin
        Jump = 1'b1;
        PcSrc = 1'b1;
      end
    endcase
  end
endmodule