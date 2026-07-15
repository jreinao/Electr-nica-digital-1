module acc_cos_TB;
 reg clk; reg add; reg load;
 reg [31:0] z_Cont;
 wire [15:0] Cos;

 acc_cos uut( .clk(clk), .z_Cont(z_Cont), .add(add), .load(load), .Cos(Cos) );

 initial begin 
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  load = 0; add = 0; z_Cont = 32'd5;
 end

 initial begin 
  #20 load = 1; // Reinicia a 0
  @ (posedge clk);
  load = 0;
  @ (posedge clk);
  add = 1; 
  #120 add = 0;
 end

 initial begin: TEST_CASE
  $dumpfile("acc_cos_TB.vcd");
  $dumpvars(-1, uut);
  #(500) $finish;
 end
endmodule