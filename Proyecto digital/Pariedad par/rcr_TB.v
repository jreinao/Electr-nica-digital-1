`timescale 1ns / 1ps
module rcr_TB;
 reg clk, shift, load; reg [15:0] N; wire [15:0] A;
 rcr uut(.clk(clk), .N(N), .shift(shift), .load(load), .A(A));
 initial begin forever begin clk = 0; #20 clk = 1; #20; end end
 initial begin load = 0; shift = 0; N = 16'd13; end
 initial begin 
  #20 load = 1; @(posedge clk); load = 0;
  @(posedge clk); shift = 1; #40 shift = 0;
 end
 initial begin: TEST_CASE $dumpfile("rcr_TB.vcd"); $dumpvars(-1, uut); #(200) $finish; end
endmodule