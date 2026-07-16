module lcr(clk, A, shift, load, B);
    input clk, shift, load;
    input [15:0] A;
    output reg [15:0] B;

    initial B = 0;

    always @(posedge clk) begin
        if(load)
            B = 0;
        else begin
            if(shift) B = A << 1;
            else B = B;
        end
    end
endmodule