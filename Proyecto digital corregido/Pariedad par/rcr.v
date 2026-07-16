module rcr(clk, N, shift, load, A);
    input clk, shift, load;
    input [15:0] N;
    output reg [15:0] A;

    initial A = 0;

    always @(posedge clk) begin
        if(load)
            A = N;
        else begin
            if(shift) A = A >> 1;
            else A = A;
        end
    end
endmodule