`timescale 1ns / 1ps
module acc_q_TB;
 reg clk, load_q, add, reset; 
 reg [15:0] z_Cont; 
 wire [15:0] Q;

 acc_q uut(.clk(clk), .z_Cont(z_Cont), .load_q(load_q), .add(add), .reset(reset), .Q(Q));

 initial begin 
  forever begin 
   clk = 0; #20 clk = 1; #20; 
  end 
 end

 initial begin 
  reset = 0; load_q = 0; add = 0; z_Cont = 16'd10; 
 end

 initial begin 
  #20 reset = 1; 
  @(posedge clk); 
  reset = 0;
  @(posedge clk); 
  load_q = 1; add = 1; 
  @(posedge clk); 
  load_q = 1; add = 0; 
  @(posedge clk); 
  load_q = 0;
 end

 initial begin: TEST_CASE 
  $dumpfile("acc_q_TB.vcd"); 
  $dumpvars(-1, uut); 
  #(300) $finish; 
 end
endmodule