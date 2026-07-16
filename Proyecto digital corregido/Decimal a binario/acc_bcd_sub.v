module acc_bcd_sub(in_bcd, sub_en, out_bcd);
    input [15:0] in_bcd;
    input sub_en;
    output reg [15:0] out_bcd;

    always @(*) begin
        if(sub_en) begin
            out_bcd[15:12] <= (in_bcd[15:12] >= 8) ? in_bcd[15:12] - 3 : in_bcd[15:12];
            out_bcd[11:8]  <= (in_bcd[11:8]  >= 8) ? in_bcd[11:8]  - 3 : in_bcd[11:8];
            out_bcd[7:4]   <= (in_bcd[7:4]   >= 8) ? in_bcd[7:4]   - 3 : in_bcd[7:4];
            out_bcd[3:0]   <= (in_bcd[3:0]   >= 8) ? in_bcd[3:0]   - 3 : in_bcd[3:0];
        end else begin
            out_bcd <= in_bcd;
        end
    end
endmodule