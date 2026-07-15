module control_div_TB;
 reg clk; reg rst; reg init;
 reg z; reg x; reg y;
 wire done, w_sh_l, w_sh_r, w_rst, w_add, w_load_rsr;

 control_div uut( 
  .clk(clk), .rst(rst), .init(init), 
  .z(z), .x(x), .y(y), 
  .done(done), .w_sh_l(w_sh_l), .w_sh_r(w_sh_r), 
  .w_rst(w_rst), .w_add(w_add), .w_load_rsr(w_load_rsr) 
 );

 initial begin 
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  rst = 0; init = 0; z = 0; x = 0; y = 0;
 end

 initial begin 
  #20 rst = 1;
  #40 rst = 0;
  #40 init = 1; 
  #100 z = 1;   
  #40 y = 1;    
  #40 x = 1;    
  #80 x = 0;    
  #80 y = 0;    
  #100 init = 0; 
 end

 initial begin: TEST_CASE
  $dumpfile("control_div_TB.vcd");
  $dumpvars(-1, uut);
  #(1000) $finish;
 end
endmodule