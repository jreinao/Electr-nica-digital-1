module control_div( clk, rst, init, z, x, y, done, w_sh_l, w_sh_r, w_rst, w_add, w_load_rsr );
    input clk, rst, init, z, x, y;
    output reg done, w_sh_l, w_sh_r, w_rst, w_add, w_load_rsr;

    parameter START       = 3'b000;
    parameter CHECK_ALIGN = 3'b001;
    parameter SHIFT_LEFT  = 3'b010;
    parameter CHECK_CONT  = 3'b011;
    parameter CHECK_SUB   = 3'b100;
    parameter ADDER       = 3'b101;
    parameter SHIFT_RIGHT = 3'b110;
    parameter DONE_ST     = 3'b111; // Equivale a su estado END

    reg [2:0] state;
    
    reg [4:0] cont;

    initial begin
        done = 0; w_sh_l = 0; w_sh_r = 0; w_rst = 0; w_add = 0; w_load_rsr = 0;
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
                        cont = 0; 
                        state = CHECK_ALIGN;
                    end else begin
                        state = START;
                    end
                end
                
                CHECK_ALIGN: begin
                    if(z) state = CHECK_CONT;
                    else state = SHIFT_LEFT;
                end
                
                SHIFT_LEFT: begin
                    state = CHECK_ALIGN;
                end
                
                CHECK_CONT: begin
                    if(y) state = CHECK_SUB;
                    else state = DONE_ST;
                end
                
                CHECK_SUB: begin
                    if(x) state = ADDER;
                    else state = SHIFT_RIGHT;
                end
                
                ADDER: begin
                    state = SHIFT_RIGHT;
                end
                
                SHIFT_RIGHT: begin
                    state = CHECK_CONT;
                end
                
                DONE_ST: begin
                    if(cont == 28) begin
                        state = START;
                    end else begin
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
                w_sh_l <= 0; 
                w_sh_r <= 0; 
                w_add <= 0; 
                w_load_rsr <= 0;
            end
            CHECK_ALIGN: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_l <= 0; 
                w_sh_r <= 0; 
                w_add <= 0;
                if(z) w_load_rsr <= 1; 
                else w_load_rsr <= 0;
            end
            SHIFT_LEFT: begin
                done <= 0;
                 w_rst <= 0; 
                 w_sh_l <= 1;
                  w_sh_r <= 0; 
                  w_add <= 0; 
                  w_load_rsr <= 0;
            end
            CHECK_CONT: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_l <= 0; 
                w_sh_r <= 0; 
                w_add <= 0; 
                w_load_rsr <= 0;
            end
            CHECK_SUB: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_l <= 0; 
                w_sh_r <= 0; 
                w_add <= 0; 
                w_load_rsr <= 0;
            end
            ADDER: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_l <= 0; 
                w_sh_r <= 0; 
                w_add <= 1; 
                w_load_rsr <= 0;
            end
            SHIFT_RIGHT: begin
                done <= 0; 
                w_rst <= 0; 
                w_sh_l <= 0; 
                w_sh_r <= 1; 
                w_add <= 0; 
                w_load_rsr <= 0;
            end
            DONE_ST: begin
                done <= 1;
                 w_rst <= 0; 
                 w_sh_l <= 0; 
                 w_sh_r <= 0; 
                 w_add <= 0; 
                 w_load_rsr <= 0;
            end
            default: begin
                done <= 0; 
                w_rst <= 1; 
                w_sh_l <= 0; 
                w_sh_r <= 0; 
                w_add <= 0; 
                w_load_rsr <= 0;
            end
        endcase
    end
endmodule