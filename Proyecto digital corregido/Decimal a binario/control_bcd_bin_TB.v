`timescale 1ns / 1ps
module control_bcd_bin_TB;
    reg clk, rst, init, z;
    wire done, w_sh_r, w_rst, w_sub;
    control_bcd_bin uut(.clk(clk), .rst(rst), .init(init), .z(z), .done(done), .w_sh_r(w_sh_r), .w_rst(w_rst), .w_sub(w_sub));
    initial begin forever begin clk = 0; #20 clk = 1; #20; end end
    initial begin rst = 0; init = 0; z = 0; #20 rst = 1; #40 rst = 0; #40 init = 1; #2500 $finish; end
endmodule
