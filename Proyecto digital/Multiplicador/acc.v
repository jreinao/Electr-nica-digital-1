module acc(clk, rst, add, A, PP);
    input clk, rst, add;
    input [31:0] A;
    output reg [31:0] PP;

    always @(negedge clk) 
        if (rst) 
            PP = 32'h00000000;
        else
            begin
            if (add) PP = PP + A;
            else PP = PP;
        end
endmodule