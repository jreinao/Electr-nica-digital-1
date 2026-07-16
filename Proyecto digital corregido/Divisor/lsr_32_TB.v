module lsr_32_TB;
 reg clk; reg shift; reg load;
 reg [31:0] in_A;
 wire [31:0] s_A;

 lsr_32 uut( .clk(clk), .in_A(in_A), .shift(shift), .load(load), .s_A(s_A) );

 initial begin // Process for clk
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  load = 0; shift = 0; in_A = 32'h00000005;
 end

 initial begin 
  #20 load = 1;
  @ (posedge clk);
  load = 0;
  @ (posedge clk);
  shift = 1; 
  #160 shift = 0;
 end

 initial begin: TEST_CASE
  $dumpfile("lsr_32_TB.vcd");
  $dumpvars(-1, uut);
  #(500) $finish;
 end
endmodule