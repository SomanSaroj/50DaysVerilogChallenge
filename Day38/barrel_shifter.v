`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 23:32:53
// Design Name: 
// Module Name: barrel_shifter
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


module barrel_shifter(
    output reg [7:0] out,
    input [7:0] in,
    input [2:0] shift,
    input direction    );
always @(in or shift or direction) begin
        if (direction == 0) begin // left shift
            out = in << shift;
        end else begin // right shift
            out = in >> shift;
        end
    end

    
endmodule
