`timescale 1ns / 1ps
module acc_bcd_adjust_TB;
 reg [15:0] in_bcd;
 reg sub_en;
 wire [15:0] out_bcd;

 acc_bcd_adjust uut(
  .in_bcd(in_bcd), .sub_en(sub_en), .out_bcd(out_bcd)
 );

 initial begin
  in_bcd = 16'h0000; sub_en = 0;
  
  #40 in_bcd = 16'h0005; sub_en = 1; 

  #40 in_bcd = 16'h0004; sub_en = 1; 
  
  #40 in_bcd = 16'h9845; sub_en = 1;

  #40 sub_en = 0;
 end

 initial begin: TEST_CASE 
  $dumpfile("acc_bcd_adjust_TB.vcd"); 
  $dumpvars(-1, uut); 
  #(250) $finish; 
 end
endmodule