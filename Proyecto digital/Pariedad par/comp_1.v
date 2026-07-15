module comp_1(LSB, z);
    input [15:0] LSB;
    output z;
    reg tmp;

    initial tmp = 0;
    assign z = tmp;

    always @(*)
        tmp <= (LSB == 16'd1) ? 1'b1 : 1'b0;
endmodule