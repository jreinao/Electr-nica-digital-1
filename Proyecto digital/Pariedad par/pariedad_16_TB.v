`timescale 1ns / 1ps
module pariedad_16_TB;
 reg clk, rst, init; reg [15:0] N;
 wire es_par, es_impar, done;

 pariedad_16 uut(
  .clk(clk), .rst(rst), .init(init), .N(N),
  .es_par(es_par), .es_impar(es_impar), .done(done)
 );

 initial begin forever begin clk = 0; #20 clk = 1; #20; end end
 initial begin rst = 0; init = 0; N = 16'd0; end
 initial begin 
  #20 rst = 1; #40 rst = 0;
  N = 16'd13; 
  #40 init = 1;
  wait(done == 1'b1); #40 init = 0;
 end
 initial begin: TEST_CASE $dumpfile("pariedad_16_TB.vcd"); $dumpvars(-1, uut); #(600) $finish; end
endmodule