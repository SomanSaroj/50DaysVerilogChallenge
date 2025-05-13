`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 19:24:08
// Design Name: 
// Module Name: upcounter_4bit
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


module upcounter_4bit(
    output [3:0] y,
    input clk,
    input rst
    );
    reg [3:0]count;
    always @(posedge clk or posedge rst) begin
        if(rst) begin count<=4'b0000; end
        else begin
            count<=count+1'b1;
            end
            
     end
     assign y=count;
     
endmodule
