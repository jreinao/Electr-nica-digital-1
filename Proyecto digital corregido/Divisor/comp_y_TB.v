module comp_y_TB;
 reg [31:0] Cont;
 wire y;

 comp_y uut( .Cont(Cont), .y(y) );

 initial begin
  Cont = 32'd0;
  #40 Cont = 32'd10; 
  #40 Cont = 32'd0;  
 end

 initial begin: TEST_CASE
  $dumpfile("comp_y_TB.vcd");
  $dumpvars(-1, uut);
  #(150) $finish;
 end
endmodule