`timescale 1ns / 1ps
module acc_n_TB;
 reg clk, load, sub_n; 
 reg [15:0] in_N, Temp; 
 wire [15:0] w_N;

 acc_n uut(.clk(clk), .in_N(in_N), .Temp(Temp), .load(load), .sub_n(sub_n), .w_N(w_N));

 initial begin 
  forever begin 
   clk = 0; #20 clk = 1; #20; 
  end 
 end

 initial begin 
  load = 0; sub_n = 0; in_N = 16'd100; Temp = 16'd20; 
 end

 initial begin 
  #20 load = 1; 
  @(posedge clk); 
  load = 0;
  @(posedge clk); 
  sub_n = 1; 
  @(posedge clk); 
  sub_n = 0;
 end

 initial begin: TEST_CASE 
  $dumpfile("acc_n_TB.vcd"); 
  $dumpvars(-1, uut); 
  #(300) $finish; 
 end
endmodule