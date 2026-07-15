module control_pariedad(clk, rst, init, z, done, w_sh_l, w_sh_r, w_rst, w_sub);
    input clk, rst, init, z;
    output reg done, w_sh_l, w_sh_r, w_rst, w_sub;

    parameter START   = 3'b000;
    parameter SHIFT_L = 3'b001;
    parameter SHIFT_R = 3'b010;
    parameter SUBT    = 3'b011;
    parameter CHECK   = 3'b100;
    parameter DONE_ST = 3'b101;

    reg [2:0] state;
    reg [4:0] cont;

    initial begin
        done = 0; w_sh_l = 0; w_sh_r = 0; w_rst = 0; w_sub = 0;
        state = START;
        cont = 0;
    end

    always @(posedge clk) begin
        if (rst) begin
            state = START;
        end else begin
            case(state)
                START: begin
                    if(init) begin 
                        state = SHIFT_R;
                        cont = 0;
                    end
                    else state = START;
                end
                SHIFT_L: begin
                    state = SHIFT_L;
                end
                SHIFT_L: begin
                    state = SUBT;
                end
                SUBT: begin
                    state = CHECK;
                end
                CHECK: begin
                    state = DONE_ST;
                end
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
            START: begin
                done <= 0;
                 w_rst <= 1; 
                 w_sh_r <= 0; 
                 w_sh_l <= 0; 
                 w_sub <= 0;
            end
            SHIFT_L: begin
                done <= 0; 
                w_rst <= 0;
                 w_sh_r <= 0; 
                 w_sh_l <= 1; 
                 w_sub <= 0;
            end
            SHIFT_R: begin
                done <= 0;
                 w_rst <= 0; 
                 w_sh_r <= 1; 
                 w_sh_l <= 0; 
                 w_sub <= 0;
            end
            SUBT: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_r <= 0; 
                w_sh_l <= 0; 
                w_sub <= 1;
            end
            CHECK: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_r <= 0; 
                w_sh_l <= 0; 
                w_sub <= 0;
            end
            DONE_ST: begin
                done <= 1; 
                w_rst <= 0; 
                w_sh_r <= 0; 
                w_sh_l <= 0; 
                w_sub <= 0;
            end
            default: begin
                done <= 0; 
                w_rst <= 1; 
                w_sh_r <= 0; 
                w_sh_l <= 0; 
                w_sub <= 0;
            end
        endcase
    end
endmodule