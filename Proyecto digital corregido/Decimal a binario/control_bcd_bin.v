module control_bcd_bin(clk, rst, init, z, done, w_sh_r, w_rst, w_sub);
    input clk, rst, init, z;
    output reg done, w_sh_r, w_rst, w_sub;

    parameter START   = 3'b000;
    parameter CHECK   = 3'b001;
    parameter ADD     = 3'b010;
    parameter SHIFT_R = 3'b011;
    parameter DONE_ST = 3'b100;

    reg [2:0] state;
    reg [4:0] cont; 

    initial begin
        done = 0; w_sh_r = 0; w_rst = 0; w_sub = 0;
        state = START; cont = 0;
    end

    always @(posedge clk) begin
        if (rst) begin
            state = START;
        end else begin
            case(state)
                START: begin
                    if(init) begin 
                        cont = 0;
                        state = CHECK; 
                    end else state = START;
                end
                CHECK: begin
                    if(z) state = DONE_ST;
                    else state = ADD;
                end
                ADD: state = SHIFT_R;
                SHIFT_R: state = CHECK;
                DONE_ST: begin
                    if(cont == 28) state = START;
                    else begin
                        cont = cont + 1;
                        state = DONE_ST;
                    end
                end
                default: state = START;
            endcase
        end
    end

    always @(*) begin
        case(state)
            START:   begin done <= 0; w_rst <= 1; w_sh_r <= 0; w_sub <= 0; end
            CHECK:   begin done <= 0; w_rst <= 0; w_sh_r <= 0; w_sub <= 0; end
            ADD:     begin done <= 0; w_rst <= 0; w_sh_r <= 0; w_sub <= 1; end
            SHIFT_R: begin done <= 0; w_rst <= 0; w_sh_r <= 1; w_sub <= 0; end
            DONE_ST: begin done <= 1; w_rst <= 0; w_sh_r <= 0; w_sub <= 0; end
            default: begin done <= 0; w_rst <= 1; w_sh_r <= 0; w_sub <= 0; end
        endcase
    end
endmodule