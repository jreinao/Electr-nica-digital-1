`timescale 1ns / 1ps
module acc_bcd_sub_TB;
    reg [15:0] in_bcd; reg sub_en; wire [15:0] out_bcd;
    acc_bcd_sub uut(in_bcd, sub_en, out_bcd);
    initial begin 
        in_bcd = 16'h9845; sub_en = 1; 
        #40 sub_en = 0;
    end
    initial begin: TEST_CASE $dumpfile("acc_bcd_sub_TB.vcd"); $dumpvars(-1, uut); #100 $finish; end
endmodule