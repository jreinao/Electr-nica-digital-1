module rsr_cont (clk, load, shift, z_Cont);
    input clk, load, shift;
    output reg [15:0] z_Cont;
    
    initial z_Cont = 0;
    
    always @(posedge clk) begin
        if(load) 
            z_Cont = 16'h4000; // 1 << (16-2) = 1 << 14 = 16384 (Base 4)
        else begin
            if(shift) z_Cont = z_Cont >> 2;
            else z_Cont = z_Cont;
        end
    end
endmodule