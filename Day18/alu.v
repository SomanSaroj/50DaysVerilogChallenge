`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 19:23:46
// Design Name: 
// Module Name: alu
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


module alu(
    output reg [3:0] y,
    output reg cout,
    input [1:0] op,
    input [3:0] a,
    input [3:0] b
    );
    
    initial cout=0;
    always @(a or b or op) begin
        case (op)
            2'b00:{cout,y}=a+b;
            2'b01:y=a-b;
            2'b10:y=a&b;
            2'b11:y=a|b;
            default: y=4'b0000;
        endcase
       end
endmodule
