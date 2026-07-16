module rsr_32_TB;
 reg clk; reg shift; reg load;
 reg [31:0] in_B;
 wire [31:0] s_B;

 rsr_32 uut( .clk(clk), .in_B(in_B), .shift(shift), .load(load), .s_B(s_B) );

 initial begin 
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  load = 0; shift = 0; in_B = 32'h00000080; 
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
  $dumpfile("rsr_32_TB.vcd");
  $dumpvars(-1, uut);
  #(500) $finish;
 end
endmodule