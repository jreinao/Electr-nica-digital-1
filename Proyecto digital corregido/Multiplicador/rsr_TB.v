`timescale 1ns / 1ps
`define SIMULATION

module rsr_TB;

   reg clk;
   reg load;
   reg shift;
   reg [4:0]in_B;

   rsr uut( .clk(clk) , .in_B(in_B) , .shift(shift) , .load(load)  );

   parameter PERIOD          = 20;
   parameter real DUTY_CYCLE = 0.5;
   parameter OFFSET          = 0;

   initial  begin  // Process for clk
     #OFFSET;
     forever
       begin
         clk = 1'b0;
         #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
         #(PERIOD*DUTY_CYCLE);
       end
   end

   initial begin 
      load = 0; shift = 0; in_B = 5'h0A;
   end

   reg [3:0] i;
   initial begin 
        #20 load = 1;
        @ (posedge clk);
        @ (negedge clk);
        load = 0;
        @ (posedge clk);
        @ (negedge clk);
        shift = 1;
       for(i=0; i<10; i=i+1) begin
         @ (posedge clk);
       end
   end


   initial begin: TEST_CASE
     $dumpfile("rsr_TB.vcd");
     $dumpvars(-1, uut);
     #(1000) $finish;
   end
endmodule