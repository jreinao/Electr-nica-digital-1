module comp_x_TB;
 reg [31:0] N;
 reg [31:0] TD;
 wire x;

 comp_x uut( .N(N), .TD(TD), .x(x) );

 initial begin
  N = 0; TD = 0;
  #40 N = 32'd20; TD = 32'd10; // x debe ser 1 (20 >= 10)
  #40 N = 32'd5;  TD = 32'd10; // x debe ser 0 (5 < 10)
  #40 N = 32'd10; TD = 32'd10; // x debe ser 1 (10 >= 10)
 end

 initial begin: TEST_CASE
  $dumpfile("comp_x_TB.vcd");
  $dumpvars(-1, uut);
  #(200) $finish;
 end
endmodule