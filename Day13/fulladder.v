`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:44 05/10/2025 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(sum, cout, x, y, cin);
    output sum;
    output cout;
    input x;
    input y;
    input cin;
	 wire [2:0]w;
	 halfadder g1(.sum(w[0]),.cout(w[1]),.x(x),.y(y));
	 halfadder g2(.sum(sum),.cout(w[2]),.x(w[0]),.y(cin));
	 or g3(cout,w[1],w[2]);
endmodule
