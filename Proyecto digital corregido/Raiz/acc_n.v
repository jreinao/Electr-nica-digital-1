module acc_n (clk, in_N, Temp, load, sub_n, w_N);
    input clk, load, sub_n;
    input [15:0] in_N, Temp;
    output reg [15:0] w_N;
    
    initial w_N = 0;

    always @(posedge clk) begin
        if (load) 
            w_N = in_N;
        else begin
            if (sub_n) w_N = w_N - Temp;
            else w_N = w_N;
        end
    end
endmodule