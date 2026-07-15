`timescale 1ns / 1ps
module lcr_TB;
 reg clk, shift, load; reg [15:0] A; wire [15:0] B;
 lcr uut(.clk(clk), .A(A), .shift(shift), .load(load), .B(B));
 initial begin forever begin clk = 0; #20 clk = 1; #20; end end
 initial begin load = 0; shift = 0; A = 16'd6; end
 initial begin 
  #20 load = 1; @(posedge clk); load = 0;
  @(posedge clk); shift = 1; #40 shift = 0;
 end
 initial begin: TEST_CASE $dumpfile("lcr_TB.vcd"); $dumpvars(-1, uut); #(200) $finish; end
endmodule