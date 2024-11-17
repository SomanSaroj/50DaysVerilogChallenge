`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:05 11/17/2024 
// Design Name: 
// Module Name:    basicgates 
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
module basicgates(a, b, c, x, y);
    output a;
    output b;
    output c;
    input x;
    input y;
	 and g1(a,x,y);
	 or g2(b,x,y);
	 not g3(c,a);


endmodule
