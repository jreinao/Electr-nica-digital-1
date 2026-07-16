`timescale 1ns / 1ps
module comp_TB;
 reg [15:0] LSB; wire z;
 comp uut(.LSB(LSB), .z(z));
 initial begin LSB = 16'd0; #40 LSB = 16'd1; #40 LSB = 16'd0; end
 initial begin: TEST_CASE $dumpfile("comp_TB.vcd"); $dumpvars(-1, uut); #(150) $finish; end
endmodule