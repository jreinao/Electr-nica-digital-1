`timescale 1ns / 1ps
module control_raiz_TB;
 reg clk, rst, init, x, y;
 wire done, w_rst, w_sh_r2, w_add, w_load_q, w_sub_n;

 control_raiz uut(
  .clk(clk), .rst(rst), .init(init), 
  .x(x), .y(y), .done(done), 
  .w_rst(w_rst), .w_sh_r2(w_sh_r2), .w_add(w_add), 
  .w_load_q(w_load_q), .w_sub_n(w_sub_n)
 );

 initial begin 
  forever begin 
   clk = 0; #20 clk = 1; #20; 
  end 
 end

 initial begin 
  rst = 0; init = 0; x = 0; y = 0; 
 end

 initial begin 
  #20 rst = 1;
  #40 rst = 0;
  #40 init = 1; 
  #80 y = 1; 
  #40 x = 1; 
  #80 x = 0; 
  #80 y = 0; 
  #100 init = 0; 
 end

 initial begin: TEST_CASE
  $dumpfile("control_raiz_TB.vcd");
  $dumpvars(-1, uut);
  #(1000) $finish;
 end
endmodule