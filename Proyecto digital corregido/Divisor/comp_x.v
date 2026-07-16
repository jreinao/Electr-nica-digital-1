module comp_x (N, TD, x);
    input [31:0] N;
    input [31:0] TD;
    output x;
    reg tmp;
    
    initial tmp = 0; 
    assign x = tmp;
    
    always @(*) 
        tmp <= (N >= TD) ? 1'b1 : 1'b0;
endmodule