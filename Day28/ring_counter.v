`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2025 21:29:08
// Design Name: 
// Module Name: ring_counter
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


module ring_counter(
    output [3:0] count,
    input clk,
    input reset
    );
    reg [3:0] shift_reg;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b1000;  
        end else begin
            shift_reg <= {shift_reg[0], shift_reg[3:1]};
        end
    end
    
    assign count = shift_reg;
endmodule
