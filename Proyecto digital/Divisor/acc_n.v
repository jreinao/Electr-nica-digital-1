module acc_n (clk, in_N, z_TD, sub, load, w_N);
    input clk;
    input [15:0] in_N;
    input [31:0] z_TD;
    input sub, load;
    output reg [31:0] w_N;
    
    initial w_N = 0; 
    
    always @(posedge clk) begin
        if (load) 
            w_N = {16'b0, in_N};
        else begin
            if (sub) w_N = w_N - z_TD;
            else w_N = w_N;
        end
    end
endmodule