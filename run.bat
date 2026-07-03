iverilog -g2012 -o sim rtl/*.sv testbench/*.sv
vvp sim
gtkwave waveform.vcd