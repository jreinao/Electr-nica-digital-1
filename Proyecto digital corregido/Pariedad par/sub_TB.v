`timescale 1ns / 1ps
module sub_TB;
 reg clk, subtr, load; reg [15:0] N, B; wire [15:0] LSB;
 sub uut(.clk(clk), .N(N), .B(B), .subtr(subtr), .load(load), .LSB(LSB));
 initial begin forever begin clk = 0; #20 clk = 1; #20; end end
 initial begin load = 0; subtr = 0; N = 16'd13; B = 16'd12; end
 initial begin 
  #20 load = 1; @(posedge clk); load = 0;
  @(posedge clk); subtr = 1; #40 subtr = 0;
 end
 initial begin: TEST_CASE $dumpfile("sub_TB.vcd"); $dumpvars(-1, uut); #(200) $finish; end
endmodule