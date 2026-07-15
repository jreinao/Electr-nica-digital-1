`timescale 1ns / 1ps
module div_16_TB;
 reg clk;
 reg rst;
 reg init;
 reg [15:0] in_N;
 reg [15:0] in_D;
 wire [15:0] Cos;
 wire [15:0] N_out;
 wire done;

 div_16 uut (
  .clk(clk), .rst(rst), .init(init), 
  .in_N(in_N), .in_D(in_D), 
  .Cos(Cos), .N_out(N_out), .done(done)
 );

 initial begin 
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  rst = 0; init = 0; in_N = 16'd0; in_D = 16'd0;
 end

 initial begin 
  // Operación: 25 / 4
  #20 rst = 1; 
  #40 rst = 0; 
  in_N = 16'd25; 
  in_D = 16'd4;  
  
  #40 init = 1;  
  
  wait(done == 1'b1);
  
  #80 init = 0;  
  
  // Operación 2: 100 / 3
  #100 in_N = 16'd100; in_D = 16'd3;
  #40 init = 1;
  
  wait(done == 1'b1);
  #80 init = 0;
 end

 initial begin: TEST_CASE
  $dumpfile("div_16_TB.vcd");
  $dumpvars(-1, uut);
  #(4000) $finish; 
 end
endmodule