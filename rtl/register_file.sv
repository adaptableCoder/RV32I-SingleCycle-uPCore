module register_file (
  input clk,
  input logic reg_write,              //from CU - to enable writing
  input logic [4:0] read_reg1,        //address of register to read for Operand 1
  input logic [4:0] read_reg2,        //address of register to read for Operand 2
  input logic [4:0] write_reg_addr,   //address of register to write to
  input logic [31:0] write_data,      //data to be written to the register file
  output logic [31:0] read_data1,
  output logic [31:0] read_data2
);
  logic [31:0] registers [0:31]; // 32, 32-bit registers (2D array)

  assign read_data1 = (read_reg1 != 5'b0) ? registers[read_reg1] : 32'b0;
  assign read_data2 = (read_reg2 != 5'b0) ? registers[read_reg2] : 32'b0;

  always_ff @(posedge clk) begin
    if (reg_write && write_reg_addr != 5'b00000) begin
      registers[write_reg_addr] <= write_data;
    end
  end
endmodule