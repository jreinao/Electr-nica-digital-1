`timescale 1ns / 1ps
module comp_y_TB;
 reg [15:0] z_Cont;
 wire y;

 comp_y uut(.z_Cont(z_Cont), .y(y));

 initial begin
  z_Cont = 16'd0;
  #40 z_Cont = 16'd10; 
  #40 z_Cont = 16'd0;  
 end

 initial begin: TEST_CASE
  $dumpfile("comp_y_TB.vcd");
  $dumpvars(-1, uut);
  #(150) $finish;
 end
endmodule