`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:00:51 05/05/2025 
// Design Name: 
// Module Name:    encoder8to3 
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
module encoder8to3(y, x);
    output [2:0] y;
    input [7:0] x;
	 or g1(y[0],x[1],x[3],x[5],x[7]);
	 or g2(y[1],x[2],x[3],x[6],x[7]);
	 or g3(y[2],x[4],x[5],x[6],x[7]);


endmodule
