`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:27 05/03/2025 
// Design Name: 
// Module Name:    comp1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comp1(E, G, L, a, b);
    output E;
    output G;
    output L;
    input a;
    input b;
	 
	 assign G= a & ~b;
	 assign L= ~a & b;
	 assign E= ~( a ^ b);
	 


endmodule
