`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:41 05/04/2025 
// Design Name: 
// Module Name:    dec2to4 
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
module dec2to4(y, x);
    output [3:0] y;
    input [1:0] x;
	 
	 wire [1:0]xn;
	 
	 not g1(xn[0],x[0]);
	 not g2(xn[1],x[1]);
	 
	 and g3(y[0],xn[0],xn[1]);
	 and g4(y[1],x[0],xn[1]);
	 and g5(y[2],xn[0],x[1]);
	 and g6(y[3],x[0],x[1]);
	 
	 



endmodule
