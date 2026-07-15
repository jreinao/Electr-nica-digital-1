`timescale 1ns / 1ps
module comp_x_TB;
 reg [15:0] w_N;
 reg [15:0] Temp;
 wire x;

 comp_x uut(.w_N(w_N), .Temp(Temp), .x(x));

 initial begin
  w_N = 16'd0; Temp = 16'd0;
  #40 w_N = 16'd50; Temp = 16'd20; 
  #40 w_N = 16'd10; Temp = 16'd20; 
 end

 initial begin: TEST_CASE
  $dumpfile("comp_x_TB.vcd");
  $dumpvars(-1, uut);
  #(150) $finish;
 end
endmodule