`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2025 22:21:37
// Design Name: 
// Module Name: pipo_shift_register
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


module pipo_shift_register(
    output [7:0] parallel_out,
    input clk,
    input load,
    input [7:0] parallel_in
    );
    reg [7:0] shift_reg=8'b0;  // 8-bit shift register
    
    always @(posedge clk) begin
        if (load) begin
            shift_reg <= parallel_in;
        end
    end
    
    assign parallel_out = shift_reg;
    
endmodule
