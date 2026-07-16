module contador_desc(clk, load, dec, val);
    input clk, load, dec;
    output reg [4:0] val; 

    initial val = 0;

    always @(posedge clk) begin
        if(load) 
            val = 16;
        else begin
            if(dec) val = val - 1;
            else val = val;
        end
    end
endmodule