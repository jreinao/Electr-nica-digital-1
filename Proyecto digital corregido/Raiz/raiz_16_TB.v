`timescale 1ns / 1ps
module raiz_16_TB;
 reg clk;
 reg rst;
 reg init;
 reg [15:0] in_N;
 wire [15:0] Q_out;
 wire [15:0] N_out;
 wire done;

 raiz_16 uut (
  .clk(clk), .rst(rst), .init(init), 
  .in_N(in_N), .Q_out(Q_out), .N_out(N_out), .done(done)
 );

 initial begin 
  forever begin
   clk = 1'b0; #20 clk = 1'b1; #20;
  end
 end

 initial begin 
  rst = 0; init = 0; in_N = 16'd0;
 end

 initial begin 
  // Operación: Raíz Cuadrada de 144 (Resultado esperado: 12)
  #20 rst = 1; 
  #40 rst = 0; 
  in_N = 16'd144; 
  
  #40 init = 1;  
  
  wait(done == 1'b1); 
  
  #80 init = 0;  
  
  // Operación 2: Raíz cuadrada de 250 (Resultado esperado: 15, residuo 25)
  #100 in_N = 16'd250;
  #40 init = 1;
  
  wait(done == 1'b1);
  #80 init = 0;
 end

 initial begin: TEST_CASE
  $dumpfile("raiz_16_TB.vcd");
  $dumpvars(-1, uut);
  #(4000) $finish; 
 end
endmodule