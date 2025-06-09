`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 22:00:09
// Design Name: 
// Module Name: spi_master
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


module spi_master(
    output reg sck,
    output reg mosi,
    input wire miso,
    output reg cs,
    input wire clk,
    input wire [7:0] data_out,
    output reg [7:0] data_in,
    input wire start,
    output reg done
);

reg [7:0] data_out_reg;
reg [7:0] data_in_reg;
reg [2:0] state;
reg [2:0] bit_count;

initial begin
    state = 3'd0;
    bit_count = 3'd0;
    cs = 1'b1;
    sck = 1'b0;
    mosi = 1'b0;
    data_in_reg = 8'd0;
    data_out_reg = 8'd0;
    done = 1'b0;
end

always @(posedge clk) begin
    case (state)
        3'd0: begin // Idle state
            cs <= 1'b1;
            sck <= 1'b0;
            done <= 1'b0;
            if (start) begin
                state <= 3'd1;
                data_out_reg <= data_out;
                bit_count <= 3'd7;
                cs <= 1'b0;
            end
        end
        3'd1: begin // Transmit state
            sck <= 1'b0;
            mosi <= data_out_reg[bit_count];
            state <= 3'd2;
        end
        3'd2: begin // Clock high state
            sck <= 1'b1;
            data_in_reg[bit_count] <= miso;
            state <= 3'd3;
        end
        3'd3: begin // Clock low state
            sck <= 1'b0;
            if (bit_count > 0) begin
                bit_count <= bit_count - 1;
                state <= 3'd1;
            end else begin
                state <= 3'd4;
            end
        end
        3'd4: begin // Done state
            cs <= 1'b1;
            data_in <= data_in_reg;
            done <= 1'b1;
            state <= 3'd0;
        end
    endcase
end

endmodule
