`timescale 1ns/1ps
module rv32i_core_tb;
  logic clk;
  logic reset;

  rv32i_core dut ( .clk(clk), .reset(reset));
  
  always #5 clk = ~clk; // 100MHz

  task verify_rf_write(input [4:0] addr, input [31:0] expected);
    begin
      @(posedge clk); #1 // let it settle

      // check final register file state
      if (dut.RegFile.registers[addr] !== expected) begin
        $display("\nError: RF Mismatch at x%0d", addr);
        $display("Expected: %0d | Got: %0d", expected, dut.RegFile.registers[addr]);
        $fatal(1, "Register mismatch!");
      end else begin
        $display("Pass: x%0d == %0d", addr, expected);
      end
    end
  endtask

  // task to check Data Memory
  task verify_dmem_write(input [31:0] word_index, input [31:0] expected);
    begin
      @(posedge clk); 
      #1; 

      if (dut.DataMem.mem[word_index] !== expected) begin
        $display("\nError: Memory Mismatch at Word Index %0d", word_index);
        $display("Expected: %0d | Got: %0d", expected, dut.DataMem.mem[word_index]);
        $fatal(1, "Memory mismatch!");
      end else begin
        $display("Pass: Mem[%0d] == %0d", word_index, expected);
      end
    end
  endtask

  initial begin
    clk = 0;
    reset = 1;
    #20 reset = 0;

    $dumpfile("waveform.vcd");
    $dumpvars(0, rv32i_core_tb);

    $display("\nStarting test sequence...");

    // Cycle 1: addi x10, x0, 50
    verify_rf_write(5'd10, 32'd50);

    // Cycle 2: addi x11, x0, 15
    verify_rf_write(5'd11, 32'd15);

    // Cycle 3: add x12, x10, x11 (50 + 15 = 65)
    verify_rf_write(5'd12, 32'd65);

    // Cycle 4: sub x13, x10, x11 (50 - 15 = 35)
    verify_rf_write(5'd13, 32'd35);

    // Cycle 5: sw x12, 24(x0) -> Stores 65 at byte addr 24 (word index 6)
    verify_dmem_write(32'd6, 32'd65);

    // Cycle 6: lw x14, 24(x0) -> Loads 65 from mem into x14
    verify_rf_write(5'd14, 32'd65);

    // Cycle 7: beq x12, x14, 8 -> Branch taken! 
    // This doesn't write to RF or Mem. We manually wait one cycle to stay in sync.
    @(posedge clk); #1; 
    $display("Pass: Branch Taken");

    // Cycle 8: jal x15, 8 -> Jumps, links return address (PC 32 + 4 = 36) into x15
    verify_rf_write(5'd15, 32'd36);

    // Cycle 9: add x16, x14, x13 -> (65 + 35 = 100)
    verify_rf_write(5'd16, 32'd100);
 
    // If a branch/jump failed, the CPU falls through to a trap instruction (addi x1, x0, 100).
    if (dut.RegFile.registers[1] === 32'd100) begin
       $fatal(1, "Trap triggered: Branch/Jump failed!");
    end else begin
       $display("Pass: Jumps verified");
    end

    $display("\nAll tests passed.");
    $finish;
  end
endmodule