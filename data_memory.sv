module data_memory (
  input clk,
  input mem_read,                 // to read data from memory
  input mem_write,                // to write data to memory
  input logic [31:0] address,     // address coming from ALU
  input logic [31:0] write_data,  // data to be written to memory
  output logic [31:0] read_data   // data to be read from memory
);
  logic [31:0] mem [0:1023];

  assign read_data = (mem_read) ? mem[address[31:2]] : 32'b0; // divide address by 4, by dropping 2 bits

  always_ff @(posedge clk) begin
    if(mem_write) mem[address[31:2]] <= write_data;
  end
endmodule

// similar to Instruction Memory but this is a RAM
// Data Memory is where processor stores variables, arrays, and the stack during runtime (e.g., using lw and sw instructions).