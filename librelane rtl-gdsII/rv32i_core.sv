module rv32i_core(
  input logic clk,
  input logic reset, // Added missing comma

  // Instruction Memory Interface
  output logic [31:0] imem_addr,
  input  logic [31:0] imem_data,
    
  // Data Memory Interface
  output logic [31:0] dmem_addr,
  output logic [31:0] dmem_write_data,
  input  logic [31:0] dmem_read_data,
  output logic dmem_mem_write,
  output logic dmem_mem_read
);
  logic [31:0] offset, alu_result, read_address, immediate, data1, data2, data_mem_addr, pc;
  logic [31:0] mux1, mux2, next_pc, write_data, operand1, operand2, mem_reg_mux, pc_plus_4;

  logic mem_read, mem_write, reg_write, pc_src, branch, jump, lui, mem_to_reg, alu_src1, alu_src2;

  logic [3:0] alu_control;
  logic [2:0] alu_op;

  // Route internal signals to the external memory interfaces
  assign imem_addr       = pc;
  assign dmem_addr       = alu_result;
  assign dmem_write_data = data2;
  assign dmem_mem_write  = mem_write;
  assign dmem_mem_read   = mem_read;

  control_unit CU (
    .opcode(imem_data[6:0]), // Replaced 'instruction' with 'imem_data'
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

  // InstructionMem instantiation REMOVED. 
  
  register_file RegFile(
    .clk(clk), 
    .reg_write(reg_write), 
    .read_reg1(imem_data[19:15]), // Replaced 'instruction' with 'imem_data'
    .read_reg2(imem_data[24:20]), 
    .write_reg_addr(imem_data[11:7]), 
    .write_data(write_data), 
    .read_data1(data1), 
    .read_data2(data2)
  );

  assign pc_plus_4 = pc + 32'd4; 
  assign write_data = jump ? pc_plus_4 : (lui ? immediate : mem_reg_mux);

  immediate_generator ImmGen(
    .instruction(imem_data), // Replaced 'instruction' with 'imem_data'
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
    .func3(imem_data[14:12]), // Replaced 'instruction' with 'imem_data'
    .bit30(imem_data[30]), 
    .alu_control(alu_control)
  );

  // DataMem instantiation REMOVED.

  // Replaced 'read_data' with 'dmem_read_data'
  assign mem_reg_mux = mem_to_reg ? dmem_read_data : alu_result; 

endmodule