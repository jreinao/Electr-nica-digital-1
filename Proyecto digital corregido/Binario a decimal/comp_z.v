module comp_z(val, z);
    input [4:0] val;
    output z;
    reg tmp;

    initial tmp = 0;
    assign z = tmp;

    always @(*)
        tmp <= (val == 5'd0) ? 1'b1 : 1'b0;
endmodule