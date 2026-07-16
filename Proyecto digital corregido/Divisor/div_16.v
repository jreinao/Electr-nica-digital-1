module div_16(clk, rst, init, in_N, in_D, Cos, N_out, done);
    input clk;
    input rst;
    input init;
    input [15:0] in_N;
    input [15:0] in_D;
    output [15:0] Cos;
    output [15:0] N_out;
    output done;

    wire w_sh_l, w_sh_r, w_rst, w_add, w_load_rsr;
    wire z, x, y;
    
    wire [31:0] w_TD, w_Cont;
    wire [31:0] z_TD, z_Cont;
    wire [31:0] w_N;

    assign N_out = w_N[15:0];

    control_div control0 (
        .clk(clk), .rst(rst), .init(init), 
        .z(z), .x(x), .y(y), 
        .done(done), .w_sh_l(w_sh_l), .w_sh_r(w_sh_r), 
        .w_rst(w_rst), .w_add(w_add), .w_load_rsr(w_load_rsr)
    );

    contador_desc count0 (.clk(clk), .dec(w_sh_l), .load(w_rst), .z(z));

    lsr_32 lsr_td   (.clk(clk), .in_A({16'b0, in_D}), .shift(w_sh_l), .load(w_rst), .s_A(w_TD));
    lsr_32 lsr_cont (.clk(clk), .in_A(32'd1),         .shift(w_sh_l), .load(w_rst), .s_A(w_Cont));

    rsr_32 rsr_td   (.clk(clk), .in_B(w_TD),   .shift(w_sh_r), .load(w_load_rsr), .s_B(z_TD));
    rsr_32 rsr_cont (.clk(clk), .in_B(w_Cont), .shift(w_sh_r), .load(w_load_rsr), .s_B(z_Cont));

    acc_n acc_n0     (.clk(clk), .in_N(in_N), .z_TD(z_TD), .sub(w_add), .load(w_rst), .w_N(w_N));
    acc_cos acc_cos0 (.clk(clk), .z_Cont(z_Cont), .add(w_add), .load(w_rst), .Cos(Cos));

    comp_x comp_x0 (.N(w_N), .TD(z_TD), .x(x));
    comp_y comp_y0 (.Cont(z_Cont), .y(y));

endmodule