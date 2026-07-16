module rsr (clk, in_B, shift, load, s_B);
    input clk, shift, load;
    input [15:0] in_B;
    output reg [15:0] s_B;

    always @(negedge clk) 
        if (load) 
            s_B <= in_B;
        else
            begin
            if (shift) s_B = s_B >> 1;
            else s_B = s_B;
        end
    
endmodule