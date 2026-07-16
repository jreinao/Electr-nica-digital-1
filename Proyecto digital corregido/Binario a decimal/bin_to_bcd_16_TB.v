`timescale 1ns / 1ps
module bin_to_bcd_16_TB;
    reg clk, rst, init; reg [15:0] A;
    wire [15:0] BCD_out; wire done;
    bin_to_bcd_16 uut(.clk(clk), .rst(rst), .init(init), .A(A), .BCD_out(BCD_out), .done(done));
    initial begin forever begin clk = 0; #20 clk = 1; #20; end end
    initial begin 
        rst = 0; init = 0; A = 16'd255; // 255 en decimal
        #20 rst = 1; #40 rst = 0;
        #40 init = 1; wait(done == 1); #40 init = 0;
    end
    initial begin: TEST_CASE $dumpfile("bin_to_bcd_16_TB.vcd"); $dumpvars(-1, uut); #(2000) $finish; end
endmodule