`timescale 1ns / 1ps
module rcr_32_combined_TB;
    reg clk, shift, load, load_adj; reg [31:0] in_A; reg [15:0] in_adj; wire [31:0] s_out;
    rcr_32_combined uut(clk, in_A, in_adj, shift, load, load_adj, s_out);
    initial begin forever begin clk = 0; #20 clk = 1; #20; end end
    initial begin load = 0; shift = 0; load_adj = 0; in_A = 32'h1234_0000; in_adj = 16'h5555; end
    initial begin #20 load = 1; #40 load = 0; #40 shift = 1; #40 shift = 0; #40 load_adj = 1; end
    initial begin: TEST_CASE $dumpfile("rcr_32_combined_TB.vcd"); $dumpvars(-1, uut); #300 $finish; end
endmodule