`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2025 22:01:12
// Design Name: 
// Module Name: spi_slave
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

module spi_slave(
    input wire sck,
    input wire mosi,
    output reg miso,
    input wire cs,
    input wire clk,
    input wire [7:0] data_out,
    output reg [7:0] data_in
);

reg [7:0] data_out_reg;
reg [7:0] data_in_reg;
reg [2:0] bit_count;

always @(posedge clk) begin
    if (!cs) begin
        if (sck) begin
            data_in_reg <= {data_in_reg[6:0], mosi};
            bit_count <= bit_count + 1;
        end
        miso <= data_out_reg[7 - bit_count];
    end else begin
        bit_count <= 3'd0;
        data_out_reg <= data_out;
        data_in_reg <= 8'd0;
    end
end

always @(negedge cs) begin
    data_in <= data_in_reg;
end

endmodule
