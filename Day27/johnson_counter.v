`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2025 20:32:30
// Design Name: 
// Module Name: johnson_counter
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


module johnson_counter(
    output [3:0] count,
    input clk,
    input reset
    );
    
    reg [3:0] shift_reg;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg<=4'b0000;
        end 
        else begin
            shift_reg <= {shift_reg[2:0], ~shift_reg[3]};
        end
    end
    assign count = shift_reg;
endmodule
