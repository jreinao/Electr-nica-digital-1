module lcr_32(clk, in_A, in_adj, shift, load, load_adj, s_out);
    input clk, shift, load, load_adj;
    input [31:0] in_A;      
    input [15:0] in_adj;   
    output reg [31:0] s_out;

    initial s_out = 0;

    always @(posedge clk) begin
        if(load) 
            s_out = in_A;
        else if(load_adj)
            s_out[31:16] = in_adj; 
        else if(shift)
            s_out = s_out << 1;
    end
endmodule