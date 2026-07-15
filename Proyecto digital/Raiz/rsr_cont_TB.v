`timescale 1ns / 1ps
module rsr_cont_TB;
 reg clk, load, shift; 
 wire [15:0] z_Cont;

 rsr_cont uut(.clk(clk), .load(load), .shift(shift), .z_Cont(z_Cont));

 initial begin 
  forever begin 
   clk = 0; #20 clk = 1; #20; 
  end 
 end

 initial begin 
  load = 0; shift = 0; 
 end

 initial begin 
  #20 load = 1; 
  @(posedge clk); 
  load = 0; 
  @(posedge clk); 
  shift = 1; 
  #120 shift = 0; 
 end

 initial begin: TEST_CASE 
  $dumpfile("rsr_cont_TB.vcd"); 
  $dumpvars(-1, uut); 
  #(300) $finish; 
 end
endmodule