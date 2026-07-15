module acc_q (clk, z_Cont, load_q, add, reset, Q);
    input clk, load_q, add, reset;
    input [15:0] z_Cont;
    output reg [15:0] Q;
    
    initial Q = 0;

    always @(posedge clk) begin
        if(reset)
            Q = 0;
        else begin
            if(load_q) begin
                if(add) Q = (Q >> 1) + z_Cont;
                else    Q = Q >> 1;
            end else begin
                Q = Q;
            end
        end
    end
endmodule