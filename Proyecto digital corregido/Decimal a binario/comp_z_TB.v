`timescale 1ns / 1ps
module comp_z_TB;
 reg [4:0] val; 
 wire z;

 comp_z uut(.val(val), .z(z));

 initial begin
  val = 5'd10;
  #40 val = 5'd0;  // z debe ser 1
  #40 val = 5'd5;  // z debe ser 0
 end

 initial begin: TEST_CASE 
  $dumpfile("comp_z_TB.vcd"); 
  $dumpvars(-1, uut); 
  #(150) $finish; 
 end
endmodule