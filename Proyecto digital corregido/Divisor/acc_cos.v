module acc_cos (clk, z_Cont, add, load, Cos);
    input clk;
    input [31:0] z_Cont;
    input add, load;
    output reg [15:0] Cos;

    initial Cos = 0;

    always @(posedge clk) begin
        if (load) 
            Cos = 0;
        else begin
            if (add) Cos = Cos + z_Cont[15:0];
            else Cos = Cos;
        end
    end
endmodule