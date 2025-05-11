`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:43 05/11/2025 
// Design Name: 
// Module Name:    carry_look_ahead_adder 
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
module carry_look_ahead_adder(sum, cout, a, b, cin);
    output [3:0] sum;
    output cout;
    input [3:0] a;
    input [3:0] b;
    input cin;
	 wire [3:0]p;
	 wire [3:0]g;
	 wire [9:0]w;
	 wire [2:0]c;
	 
	 xor g1[3:0](p,a,b);
	 and g2[3:0](g,a,b);
	 
	 assign c[0]=g[0]|(p[0]&cin);
	 assign c[1]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
	 assign c[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
	 assign cout=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
	 
	 xor g3(sum[0],p[0],cin);
	 xor g4(sum[1],p[1],c[0]);
	 xor g5(sum[2],p[2],c[1]);
	 xor g6(sum[3],p[3],c[2]);
	 

endmodule
