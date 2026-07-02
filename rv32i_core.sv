module rv32i_core(
  input clk,
  input reset
);
  logic [31:0] instruction, offset, alu_result, read_address, immediate, data1, data2, data_mem_addr, pc, read_data;
  logic [31:0] mux1, mux2, next_pc, write_data, operand1, operand2, mem_reg_mux;

  logic mem_read, mem_write, reg_write, pc_src, branch, jump, lui, mem_to_reg, alu_src1, alu_src2;

  logic [3:0] alu_control;
  logic [2:0] alu_op;

  control_unit CU (
    .opcode(instruction[6:0]), 
    .lui(lui), 
    .PcSrc(pc_src), 
    .MemRead(mem_read), 
    .MemWrite(mem_write), 
    .AluOp(alu_op), 
    .MemToReg(mem_to_reg), 
    .AluSrc1(alu_src1), 
    .AluSrc2(alu_src2), 
    .RegWrite(reg_write), 
    .Jump(jump), 
    .Branch(branch)
  );

  assign mux1 = pc_src ? data1 : pc;
  assign mux2 = (jump || (branch && alu_result[0])) ? immediate : 32'd4;

  assign next_pc = mux1 + mux2;

  program_counter PC( 
    .clk(clk), 
    .reset(reset), 
    .next_pc(next_pc), 
    .pc(pc)
  );

  instruction_memory InstructionMem( 
    .read_address(pc), 
    .instruction(instruction)
  );
  
  register_file RegFile(
    .clk(clk), 
    .reg_write(reg_write), 
    .read_reg1(instruction[19:15]), 
    .read_reg2(instruction[24:20]), 
    .write_reg_addr(instruction[11:7]), 
    .write_data(write_data), 
    .read_data1(data1), 
    .read_data2(data2)
  );

  assign write_data = lui ? immediate : mem_reg_mux;

  immediate_generator ImmGen(
    .instruction(instruction), 
    .immediate(immediate)
  );

  assign operand1 = alu_src1 ? pc : data1;
  assign operand2 = alu_src2 ? immediate : data2;

  alu ALU(
    .operand1(operand1), 
    .operand2(operand2), 
    .opcode(alu_control), 
    .result(alu_result)
  );

  alu_control_unit ALU_CU(
    .alu_op(alu_op), 
    .func3(instruction[14:12]), 
    .bit30(instruction[30]), 
    .alu_control(alu_control)
  );

  data_memory DataMem(
    .clk(clk), 
    .mem_read(mem_read), 
    .mem_write(mem_write), 
    .address(alu_result), 
    .write_data(data2), 
    .read_data(read_data)
  );

  assign mem_reg_mux = mem_to_reg ? read_data : alu_result;
endmodule