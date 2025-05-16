`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 21:51:56
// Design Name: 
// Module Name: parity_gen
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


module parity_gen(
    output y,
    input [3:0] x
    );
    wire w1,w2;
    xor g1(w1,x[0],x[1]);
    xor g2(w2,x[2],x[3]);
    xor g3(y,w1,w2);
endmodule
