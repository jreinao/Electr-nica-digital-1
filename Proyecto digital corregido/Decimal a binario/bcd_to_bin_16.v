module bcd_to_bin_16(clk, rst, init, A, BIN_out, done);
    input clk, rst, init;
    input [15:0] A; // 4 dígitos BCD
    output [15:0] BIN_out;
    output done;

    wire w_sh_r, w_rst, w_sub, z;
    wire [31:0] w_combined;
    wire [15:0] w_BCD_part;
    wire [15:0] w_BCD_adjusted;
    wire [4:0] w_val; 

    assign w_BCD_part = w_combined[31:16];
    assign BIN_out = w_combined[15:0];

    control_bcd_bin control0 (.clk(clk), .rst(rst), .init(init), .z(z),.done(done), .w_sh_r(w_sh_r), .w_rst(w_rst), .w_sub(w_sub));

    rcr_32_combined rcr0 (.clk(clk), .in_A({A, 16'b0}), .in_adj(w_BCD_adjusted), .shift(w_sh_r), .load(w_rst), .load_adj(w_sub), .s_out(w_combined));

    acc_bcd_sub acc0 (.in_bcd(w_BCD_part), .sub_en(w_sub), .out_bcd(w_BCD_adjusted));

    contador_desc count0 (.clk(clk), .load(w_rst), .dec(w_sh_r), .val(w_val));

    comp_z comp_z0 (.val(w_val), .z(z));

endmodule