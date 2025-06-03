`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 22:32:08
// Design Name: 
// Module Name: ram
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


module ram(
    output reg [7:0] data_out,
    input [7:0] data_in,
    input [3:0] addr,
    input clk,
    input we
    );
    reg [7:0] mem [15:0]; // 16x8 RAM
    
    always @(posedge clk) begin
        if (we) begin
            mem[addr] = data_in;
        end
        data_out = mem[addr];
    end
endmodule
