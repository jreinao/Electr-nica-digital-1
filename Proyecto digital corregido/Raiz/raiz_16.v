module raiz_16(clk, rst, init, in_N, Q_out, N_out, done);
    input clk;
    input rst;
    input init;
    input [15:0] in_N;
    output [15:0] Q_out;
    output [15:0] N_out;
    output done;

    wire w_rst, w_sh_r2, w_add, w_load_q, w_sub_n;
    wire x, y;

    wire [15:0] z_Cont;
    wire [15:0] Temp;
    wire [15:0] w_N;
    wire [15:0] Q;

    assign Q_out = Q;
    assign N_out = w_N;

    control_raiz control0 (
        .clk(clk), .rst(rst), .init(init), 
        .x(x), .y(y), 
        .done(done), 
        .w_rst(w_rst), .w_sh_r2(w_sh_r2), 
        .w_add(w_add), .w_load_q(w_load_q), .w_sub_n(w_sub_n)
    );

    rsr_cont rsr0 (.clk(clk), .load(w_rst), .shift(w_sh_r2), .z_Cont(z_Cont));

    acc_q acc0 (.clk(clk), .z_Cont(z_Cont), .load_q(w_load_q), .add(w_add), .reset(w_rst), .Q(Q));

    acc_n acc_n0 (.clk(clk), .in_N(in_N), .Temp(Temp), .load(w_rst), .sub_n(w_sub_n), .w_N(w_N));

    add_temp add0 (.Q(Q), .z_Cont(z_Cont), .Temp(Temp));

    comp_x comp_x0 (.w_N(w_N), .Temp(Temp), .x(x));
    comp_y comp_y0 (.z_Cont(z_Cont), .y(y));

endmodule
