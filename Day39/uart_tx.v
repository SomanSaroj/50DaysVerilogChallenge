`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 23:17:57
// Design Name: 
// Module Name: uart_tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:

module uart_tx(tx, tx_busy, clk, rst, tx_start, tx_data);
    output reg tx;
    output reg tx_busy;
    input wire clk;
    input wire rst;
    input wire tx_start;
    input wire [7:0] tx_data;
	 parameter CLK_FREQ = 50000000;
    parameter BAUD_RATE = 9600;
    localparam BAUD_TICK_COUNT = CLK_FREQ / BAUD_RATE;
    localparam IDLE = 3'd0,
               START = 3'd1,
               DATA = 3'd2,
               STOP = 3'd3;

    reg [15:0] baud_counter = 0;
    reg [2:0] state = IDLE;
    reg [2:0] bit_index = 0;
    reg [7:0] tx_shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx <= 1'b1;  // UART idle line is high
            tx_busy <= 1'b0;
            baud_counter <= 0;
            bit_index <= 0;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    tx_busy <= 1'b0;
                    if (tx_start) begin
                        tx_busy <= 1'b1;
                        tx_shift_reg <= tx_data;
                        state <= START;
                        baud_counter <= 0;
                    end
                end
                START: begin
                    tx <= 1'b0;
                    if (baud_counter < BAUD_TICK_COUNT - 1)
                        baud_counter <= baud_counter + 1;
                    else begin
                        baud_counter <= 0;
                        state <= DATA;
                        bit_index <= 0;
                    end
                end
                DATA: begin
                    tx <= tx_shift_reg[bit_index];
                    if (baud_counter < BAUD_TICK_COUNT - 1)
                        baud_counter <= baud_counter + 1;
                    else begin
                        baud_counter <= 0;
                        if (bit_index < 7)
                            bit_index <= bit_index + 1;
                        else
                            state <= STOP;
                    end
                end
                STOP: begin
                    tx <= 1'b1;
                    if (baud_counter < BAUD_TICK_COUNT - 1)
                        baud_counter <= baud_counter + 1;
                    else begin
                        baud_counter <= 0;
                        state <= IDLE;
                        tx_busy <= 1'b0;
                    end
                end
            endcase
        end
    end


endmodule
