module contador_desc_TB;
 reg clk; reg dec; reg load;
 wire z;

 contador_desc uut( .clk(clk), .dec(dec), .load(load), .z(z) );

 initial begin 
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  load = 0; dec = 0;
 end

 initial begin 
  #20 load = 1; 
  @ (posedge clk);
  load = 0;
  @ (posedge clk);
  dec = 1; 
 end

 initial begin: TEST_CASE
  $dumpfile("contador_desc_TB.vcd");
  $dumpvars(-1, uut);
  #(1000) $finish;
 end
endmodule