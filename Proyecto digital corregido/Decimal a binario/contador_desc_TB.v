`timescale 1ns / 1ps
module contador_desc_TB;
 reg clk, load, dec; 
 wire [4:0] val;

 contador_desc uut(.clk(clk), .load(load), .dec(dec), .val(val));

 initial begin 
  forever begin 
   clk = 0; #20 clk = 1; #20; 
  end 
 end

 initial begin 
  load = 0; dec = 0; 
 end

 initial begin 
  #20 load = 1; 
  @(posedge clk); load = 0;
  
  @(posedge clk); dec = 1; 
  #800 dec = 0;
 end

 initial begin: TEST_CASE 
  $dumpfile("contador_desc_TB.vcd"); 
  $dumpvars(-1, uut); 
  #(1000) $finish; 
 end
endmodule
