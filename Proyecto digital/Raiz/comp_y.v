module comp_y (z_Cont, y);
    input [15:0] z_Cont;
    output y;
    reg tmp;
    
    initial tmp = 0;
    assign y = tmp;
    
    always @(*) 
        tmp <= (z_Cont > 0) ? 1'b1 : 1'b0;
endmodule