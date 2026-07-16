module rsr_32 (clk, in_B, shift, load, s_B);
    input clk;
    input [31:0] in_B;
    input shift, load;
    output reg [31:0] s_B;

    always @(posedge clk) begin
        if(load) 
            s_B = in_B; 
        else begin
            if(shift) s_B = s_B >> 1;
            else s_B = s_B;
        end
    end
endmodule