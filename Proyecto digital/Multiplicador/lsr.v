module lsr (clk, in_A, shift, load, s_A);
    input clk, shift, load;
    input [15:0] in_A;
    output reg [30:0] s_A;

    always @(negedge clk) 
        if (load) 
            s_A = in_A;
        else
            begin
            if (shift) s_A = s_A <<1;
            else s_A = s_A;
        end
    
endmodule