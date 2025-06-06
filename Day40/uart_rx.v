`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 22:11:41
// Design Name: 
// Module Name: uart_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx(
    output reg [7:0] rx_data,
    output  rx_valid,
    input wire rx,
    input wire clk,
    input wire rst
);

parameter CLK_FREQ = 50000000;
parameter BAUD_RATE = 9600;
localparam BAUD_TICK_COUNT = CLK_FREQ / BAUD_RATE;
localparam IDLE = 3'd0, START = 3'd1, DATA = 3'd2, STOP = 3'd3;

reg [15:0] baud_counter = 0;
reg [2:0] state = IDLE;
reg [2:0] bit_index = 0;
reg [7:0] rx_shift_reg = 8'd0; // initialize rx_shift_reg
reg rx_valid_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        rx_data <= 8'd0;
        state <= IDLE;
        rx_valid_reg <= 1'b0;
        baud_counter <= 0;
        bit_index <= 0;
        rx_shift_reg <= 8'd0; // initialize rx_shift_reg
    end else begin
        case (state)
            IDLE: begin
                rx_valid_reg <= 1'b0;
                if (!rx) begin // start bit detected
                    state <= START;
                    baud_counter <= 0;
                end
            end
            START: begin
                if (baud_counter < BAUD_TICK_COUNT / 2) baud_counter <= baud_counter + 1;
                else if (baud_counter < BAUD_TICK_COUNT - 1) baud_counter <= baud_counter + 1;
                else begin
                    baud_counter <= 0;
                    state <= DATA;
                    bit_index <= 0;
                end
            end
            DATA: begin
                if (baud_counter < BAUD_TICK_COUNT - 1) baud_counter <= baud_counter + 1;
                else begin
                    baud_counter <= 0;
                    rx_shift_reg[bit_index] <= rx;
                    $display("Received bit %d: %b", bit_index, rx); // debug statement
                    if (bit_index < 7) bit_index <= bit_index + 1;
                    else state <= STOP;
                end
            end
            STOP: begin
                if (baud_counter < BAUD_TICK_COUNT - 1) baud_counter <= baud_counter + 1;
                else begin
                    baud_counter <= 0;
                    state <= IDLE;
                    rx_valid_reg <= 1'b1;
                    rx_data <= rx_shift_reg;
                    $display("Received data: %h", rx_data); // debug statement
                end
            end
        endcase
    end
end

assign rx_valid = rx_valid_reg;

endmodule
