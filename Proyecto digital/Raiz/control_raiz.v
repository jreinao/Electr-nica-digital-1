module control_raiz(clk, rst, init, x, y, done, w_rst, w_sh_r2, w_add, w_load_q, w_sub_n);
    input clk, rst, init, x, y;
    output reg done, w_rst, w_sh_r2, w_add, w_load_q, w_sub_n;

    parameter START       = 3'b000;
    parameter CHECK_CONT  = 3'b001;
    parameter CHECK_SUB   = 3'b010;
    parameter ADD_SUB     = 3'b011;
    parameter SHIFT       = 3'b100;
    parameter SHIFT_CONT  = 3'b101;
    parameter DONE_ST     = 3'b110;

    reg [2:0] state;
    reg [4:0] cont;

    initial begin
        done = 0; w_rst = 0; w_sh_r2 = 0; w_add = 0; w_load_q = 0; w_sub_n = 0;
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
                    cont=0;
                    state = CHECK_CONT;
                    end else state = START;
                end
                CHECK_CONT: begin
                    if(y == 0) state = DONE_ST;
                    else state = CHECK_SUB;
                end
                CHECK_SUB: begin
                    if(x == 1) state = ADD_SUB;
                    else state = SHIFT;
                end
                ADD_SUB: begin
                    state = SHIFT_CONT;
                end
                SHIFT: begin
                    state = SHIFT_CONT;
                end
                SHIFT_CONT: begin
                    state = CHECK_CONT;
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
                w_sh_r2 <= 0;
                 w_add <= 0; 
                 w_load_q <= 0; 
                 w_sub_n <= 0;
            end
            CHECK_CONT: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_r2 <= 0; 
                w_add <= 0; 
                w_load_q <= 0; 
                w_sub_n <= 0;
            end
            CHECK_SUB: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_r2 <= 0; 
                w_add <= 0; 
                w_load_q <= 0; 
                w_sub_n <= 0;
            end
            ADD_SUB: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_r2 <= 0; 
                w_add <= 1; 
                w_load_q <= 1; 
                w_sub_n <= 1;
            end
            SHIFT: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_r2 <= 0; 
                w_add <= 0; 
                w_load_q <= 1; 
                w_sub_n <= 0;
            end
            SHIFT_CONT: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_r2 <= 1; 
                w_add <= 0; 
                w_load_q <= 0; 
                w_sub_n <= 0;
            end
            DONE_ST: begin
                done <= 1; 
                w_rst <= 0; 
                w_sh_r2 <= 0; 
                w_add <= 0; 
                w_load_q <= 0; 
                w_sub_n <= 0;
            end
            default: begin
                done <= 0; 
                w_rst <= 1; 
                w_sh_r2 <= 0; 
                w_add <= 0; 
                w_load_q <= 0; 
                w_sub_n <= 0;
            end
        endcase
    end
endmodule
