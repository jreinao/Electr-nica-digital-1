`timescale 1ns / 1ps
module bcd_to_bin_16_TB;
    reg clk, rst, init; reg [15:0] A; wire [15:0] BIN_out; wire done;
    bcd_to_bin_16 uut(clk, rst, init, A, BIN_out, done);
    initial begin forever begin clk = 0; #20 clk = 1; #20; end end
    initial begin 
        rst = 0; init = 0; A = 16'h0025; 
        #20 rst = 1; #40 rst = 0; #40 init = 1; 
        wait(done == 1); #40 init = 0;
    end
    initial begin: TEST_CASE $dumpfile("bcd_to_bin_16_TB.vcd"); $dumpvars(-1, uut); #2500 $finish; end
endmodule