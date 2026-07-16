module pariedad_16(clk, rst, init, N, es_par, es_impar, done);
    input clk, rst, init;
    input [15:0] N;
    output es_par, es_impar, done;
    wire w_sh_l, w_sh_r, w_rst, w_sub, z;
    wire [15:0] A, B, LSB;

    control_pariedad control0 (.clk(clk), .rst(rst), .init(init), .z(z), .done(done), .w_sh_l(w_sh_l), .w_sh_r(w_sh_r), .w_rst(w_rst), .w_sub(w_sub));
    rcr rcr0 (.clk(clk), .N(N), .shift(w_sh_r), .load(w_rst), .A(A));
    lcr lcr0 (.clk(clk), .A(A), .shift(w_sh_l), .load(w_rst), .B(B));
    sub sub0 (.clk(clk), .N(N), .B(B), .subtr(w_sub), .load(w_rst), .LSB(LSB));
    comp comp0 (.LSB(LSB), .z(z));

    assign es_impar = z;
    assign es_par   = ~z;
endmodule