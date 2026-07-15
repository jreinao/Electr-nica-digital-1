module mult_32 (clk, B, A,rst,init,PP,done );
    input clk,rst,init;
    input [15:0] A,B;
    output [31:0] PP;
    output done;

    wire w_sh;
    wire w_reset;
    wire w_add;
    wire [15:0] w_z;
    wire [31:0] w_A;
    wire [31:0] w_B;

    rsr rsr0 (.clk(clk),.in_B(B),.shift(w_sh),.load(w_reset),.s_B(w_B));
    lsr lsr0 (.clk(clk),.in_A(A),.shift(w_sh),.load(w_reset),.s_A(w_A));
    comp comp0 (.B(w_B),.z(w_z));
    acc acc0 (.clk(clk),.rst(w_rst),.add(w_add),.A(w_A),PP(PP));
    control_mult control0 (.clk(clk),.rst(rst),.init(init),.z(w_z),.sh(w_sh),.reset(w_reset),.add(w_add),.done(done),.z(w_z));

    endmodule