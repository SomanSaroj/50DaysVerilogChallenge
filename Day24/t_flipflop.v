`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 21:40:18
// Design Name: 
// Module Name: t_flipflop
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


module t_flipflop(
    output reg Qn,
    output reg Q,
    input clk,
    input T
    );
    initial begin
        Q = 1'b0;
        Qn = 1'b1;
    end
    
    always @(posedge clk) begin
        if (T) begin
            Q <= ~Q;
            Qn <= ~Qn;
        end
    end
endmodule
