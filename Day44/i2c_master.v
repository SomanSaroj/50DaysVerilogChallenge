module i2c_master (scl,sda,busy,done,clk,rst,start);
    input wire clk;
    input wire rst;
    input wire start;
    output reg scl;
    output reg sda;
    output reg busy;
    output reg done;
    parameter CLK_DIV = 100;
    reg [6:0] clk_cnt;

    localparam IDLE         = 4'd0;
    localparam START_COND   = 4'd1;
    localparam SEND_ADDR    = 4'd2;
    localparam ADDR_ACK     = 4'd3;
    localparam SEND_DATA    = 4'd4;
    localparam DATA_ACK     = 4'd5;
    localparam STOP_COND    = 4'd6;
    localparam DONE_STATE   = 4'd7;

    reg [3:0] state;
    reg [3:0] bit_cnt;
    reg [7:0] addr;
    reg [7:0] data;
    reg scl_internal;
    reg scl_enable;
    initial begin
        scl          = 1;
        sda          = 1;
        busy         = 0;
        done         = 0;
        clk_cnt      = 0;
        scl_internal = 1;
        scl_enable   = 0;
        state        = IDLE;
        bit_cnt      = 7;
        addr         = 8'b10100000;
        data         = 8'hA5;
    end
    always @(posedge clk) begin
        if (rst) begin
            clk_cnt <= 0;
            scl_internal <= 1;
        end else if (scl_enable) begin
            if (clk_cnt == CLK_DIV - 1) begin
                clk_cnt <= 0;
                scl_internal <= ~scl_internal;
            end else begin
                clk_cnt <= clk_cnt + 1;
            end
        end else begin
            clk_cnt <= 0;
            scl_internal <= 1;
        end
    end
    always @(posedge clk) begin
        if (rst)
            scl <= 1;
        else if (scl_enable)
            scl <= scl_internal;
        else
            scl <= 1;
    end
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            busy <= 0;
            done <= 0;
            sda <= 1;
            scl_enable <= 0;
            bit_cnt <= 7;
            addr <= 8'b10100000;
            data <= 8'hA5;
        end else begin
            done <= 0;
            busy <= busy;
            scl_enable <= scl_enable;
            sda <= 1;
            case(state)
                IDLE: begin
                    busy <= 0;
                    scl_enable <= 0;
                    bit_cnt <= 7;
                    if (start) begin
                        busy <= 1;
                        state <= START_COND;
                    end
                end
                START_COND: begin
                    sda <= 0;
                    scl_enable <= 1;
                    if (clk_cnt == 0 && scl_internal == 1)
                        state <= SEND_ADDR;
                end
                SEND_ADDR: begin
                    if (scl_internal == 0) begin
                         if (clk_cnt == 0)
                            sda <= addr[bit_cnt];
                    end
                    if (scl_internal == 1) begin
                         if (clk_cnt == 0) begin
                            if (bit_cnt == 0) begin
                                bit_cnt <= 7;
                                state <= ADDR_ACK;
                            end else begin
                                bit_cnt <= bit_cnt - 1;
                            end
                        end
                    end
                end
                ADDR_ACK: begin
                    sda <= 1;
                    if (scl_internal == 1 && clk_cnt == 0)
                        state <= SEND_DATA;
                end
                SEND_DATA: begin
                    if (scl_internal == 0) begin
                         if (clk_cnt == 0)
                            sda <= data[bit_cnt];
                    end
                    if (scl_internal == 1) begin
                        if (clk_cnt == 0) begin
                            if (bit_cnt == 0) begin
                                bit_cnt <= 7;
                                state <= DATA_ACK;
                            end else begin
                                bit_cnt <= bit_cnt - 1;
                            end
                        end
                    end
                end
                DATA_ACK: begin
                    sda <= 1;
                    if (scl_internal == 1 && clk_cnt == 0)
                        state <= STOP_COND;
                end
                STOP_COND: begin
                    if (scl_internal == 0 && clk_cnt == 0) begin
                        sda <= 0;
                    end else if (scl_internal == 1 && clk_cnt == 0) begin
                        sda <= 1;
                        state <= DONE_STATE;
                    end
                end
                DONE_STATE: begin
                    busy <= 0;
                    done <= 1;
                    scl_enable <= 0;
                    sda <= 1;
                    state <= IDLE;
                end
                default: state <= IDLE;
            endcase
        end
    end
endmodule