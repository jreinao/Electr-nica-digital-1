`timescale 1ns / 1ps
module lcr_32_TB;
 reg clk, shift, load, load_adj;
 reg [31:0] in_A;
 reg [15:0] in_adj;
 wire [31:0] s_out;

 lcr_32 uut(
  .clk(clk), .in_A(in_A), .in_adj(in_adj), 
  .shift(shift), .load(load), .load_adj(load_adj), .s_out(s_out)
 );

 initial begin 
  forever begin 
   clk = 0; #20 clk = 1; #20; 
  end 
 end

 initial begin 
  load = 0; shift = 0; load_adj = 0; 
  in_A = 32'h0000_00FF; // Cargamos el número 255
  in_adj = 16'h1234;    // Un valor de prueba para el ajuste BCD
 end

 initial begin 
  #20 load = 1; 
  @(posedge clk); load = 0;
  
  @(posedge clk); shift = 1; 
  #80 shift = 0;
  
  @(posedge clk); load_adj = 1; 
  #40 load_adj = 0;
 end

 initial begin: TEST_CASE 
  $dumpfile("lcr_32_TB.vcd"); 
  $dumpvars(-1, uut); 
  #(400) $finish; 
 end
endmodule