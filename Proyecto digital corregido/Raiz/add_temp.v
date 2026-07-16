module add_temp (Q, z_Cont, Temp);
    input [15:0] Q, z_Cont;
    output [15:0] Temp;
    
    assign Temp = Q + z_Cont;
endmodule