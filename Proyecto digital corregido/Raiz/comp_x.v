module comp_x (w_N, Temp, x);
    input [15:0] w_N, Temp;
    output x;
    reg tmp;
    
    initial tmp = 0;
    assign x = tmp;
    
    always @(*) 
        tmp <= (w_N >= Temp) ? 1'b1 : 1'b0;
endmodule