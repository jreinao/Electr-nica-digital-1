module sub(clk, N, B, subtr, load, LSB);
    input clk, subtr, load;
    input [15:0] N, B;
    output reg [15:0] LSB;

    initial LSB = 0;

    always @(posedge clk) begin
        if(load)
            LSB = 0;
        else begin
            if(subtr) LSB = N - B;
            else LSB = LSB;
        end
    end
endmodule