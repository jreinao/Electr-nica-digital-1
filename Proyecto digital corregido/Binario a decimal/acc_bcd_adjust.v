module acc_bcd_adjust(in_bcd, sub_en, out_bcd);
    input [15:0] in_bcd;
    input sub_en;
    output reg [15:0] out_bcd;

    always @(*) begin
        if(sub_en) begin
            // Dígito 3
            out_bcd[15:12] <= (in_bcd[15:12] >= 5) ? in_bcd[15:12] + 3 : in_bcd[15:12];
            // Dígito 2
            out_bcd[11:8]  <= (in_bcd[11:8]  >= 5) ? in_bcd[11:8]  + 3 : in_bcd[11:8];
            // Dígito 1
            out_bcd[7:4]   <= (in_bcd[7:4]   >= 5) ? in_bcd[7:4]   + 3 : in_bcd[7:4];
            // Dígito 0
            out_bcd[3:0]   <= (in_bcd[3:0]   >= 5) ? in_bcd[3:0]   + 3 : in_bcd[3:0];
        end else begin
            out_bcd <= in_bcd;
        end
    end
endmodule