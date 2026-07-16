module lsr_32 (clk, in_A, shift, load, s_A);
    input clk;
    input [31:0] in_A;
    input shift, load;
    output reg [31:0] s_A;
    
    always @(posedge clk) begin
        if(load) 
            s_A = in_A; 
        else begin
            if(shift) s_A = s_A << 1;
            else s_A = s_A;
        end
    end
endmodule