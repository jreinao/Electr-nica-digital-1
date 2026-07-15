module comp_y (Cont, y);
    input [31:0] Cont;
    output y;
    reg tmp;
    
    initial tmp = 0;
    assign y = tmp;
    
    always @(*) 
        tmp <= (Cont > 0) ? 1'b1 : 1'b0;
endmodule