module bin_to_bcd_16(clk, rst, init, A, BCD_out, done);
    input clk, rst, init;
    input [15:0] A;
    output [15:0] BCD_out;
    output done;

    wire w_sh_l, w_rst, w_sub, z;

    wire [31:0] w_combined;
    wire [15:0] w_BCD_part;
    wire [15:0] w_BCD_adjusted;
    wire [4:0] w_val; 

    assign w_BCD_part = w_combined[31:16];
    assign BCD_out = w_combined[31:16];

    control_bcd control0 (.clk(clk), .rst(rst), .init(init), .z(z),.done(done), .w_sh_l(w_sh_l), .w_rst(w_rst), .w_sub(w_sub));

    lcr_32 lcr0 ( .clk(clk), .in_A({16'b0, A}), .in_adj(w_BCD_adjusted), .shift(w_sh_l), .load(w_rst), .load_adj(w_sub), .s_out(w_combined));

    acc_bcd_adjust acc0 (.in_bcd(w_BCD_part), .sub_en(w_sub), .out_bcd(w_BCD_adjusted));

    contador_desc count0 (.clk(clk), .load(w_rst), .dec(w_sh_l), .val(w_val));

    comp_z comp_z0 (.val(w_val), .z(z));


endmodule