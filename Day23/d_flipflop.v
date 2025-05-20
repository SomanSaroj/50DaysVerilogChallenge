`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2025 22:37:12
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(
    output reg Qn,
    output reg Q,
    input clk,
    input D
    );
    initial begin
        Q = 1'b0;
        Qn = 1'b1;
    end
    
    always @(posedge clk) begin
        Q <= D;
        Qn <= ~D;
    end

endmodule
