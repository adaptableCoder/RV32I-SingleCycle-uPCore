module program_counter (
  input clk,
  input reset,
  input [31:0] next_pc,
  output logic [31:0] pc
);
  always_ff @(posedge clk or posedge reset) begin
    pc <= (reset) ? 32'b0 : next_pc;
  end
endmodule

// The Program Counter is a special 32-bit register that holds the memory address of the next instruction to be executed.
// In a single-cycle processor, it updates at the end of every clock cycle.