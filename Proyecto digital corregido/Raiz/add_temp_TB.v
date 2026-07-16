`timescale 1ns / 1ps
module add_temp_TB;
 reg [15:0] Q;
 reg [15:0] z_Cont;
 wire [15:0] Temp;

 add_temp uut(.Q(Q), .z_Cont(z_Cont), .Temp(Temp));

 initial begin
  Q = 16'd0; z_Cont = 16'd0;
  #40 Q = 16'd15; z_Cont = 16'd10;
  #40 Q = 16'd100; z_Cont = 16'd50;
 end

 initial begin: TEST_CASE
  $dumpfile("add_temp_TB.vcd");
  $dumpvars(-1, uut);
  #(150) $finish;
 end
endmodule