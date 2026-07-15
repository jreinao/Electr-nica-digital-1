module acc_n_TB;
 reg clk; reg sub; reg load;
 reg [15:0] in_N;
 reg [31:0] z_TD;
 wire [31:0] w_N;

 acc_n uut( .clk(clk), .in_N(in_N), .z_TD(z_TD), .sub(sub), .load(load), .w_N(w_N) );

 initial begin 
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  load = 0; sub = 0; in_N = 16'd50; z_TD = 32'd10;
 end

 initial begin 
  #20 load = 1; // Carga el 50 inicial
  @ (posedge clk);
  load = 0;
  @ (posedge clk);
  sub = 1; 
  #120 sub = 0;
 end

 initial begin: TEST_CASE
  $dumpfile("acc_n_TB.vcd");
  $dumpvars(-1, uut);
  #(500) $finish;
 end
endmodule
