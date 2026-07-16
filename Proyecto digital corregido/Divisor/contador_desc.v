module contador_desc (clk, dec, load, z);
    input clk, dec, load;
    output z;
    reg [3:0] bs;

    initial bs = 0;

    always @(posedge clk) begin
        if(load) 
            bs = 15;
        else begin
            if(dec) bs = bs - 1;
            else bs = bs;
        end
    end
    assign z = (bs == 0) ? 1'b1 : 1'b0;
endmodule