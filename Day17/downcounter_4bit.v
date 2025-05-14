`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 14:26:48
// Design Name: 
// Module Name: downcounter_4bit
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


module downcounter_4bit(
    output [3:0] y,
    input clk,
    input rst
    );
    reg [3:0]count;
        always @(posedge clk or posedge rst) begin
            if(rst) begin count<=4'b1111; end
            else begin
                count<=count-1'b1;
                end
                
         end
         assign y=count;
endmodule
