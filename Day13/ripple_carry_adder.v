`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:29 05/10/2025 
// Design Name: 
// Module Name:    ripple_carry_adder 
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
module ripple_carry_adder(sum, cout, a, b, cin);
    output [3:0] sum;
    output cout;
    input [3:0] a;
    input [3:0] b;
    input cin;
	 wire [2:0]w;
	 fulladder g1(.sum(sum[0]),.cout(w[0]),.x(a[0]),.y(b[0]),.cin(cin));
	 fulladder g2(.sum(sum[1]),.cout(w[1]),.x(a[1]),.y(b[1]),.cin(w[0]));
	 fulladder g3(.sum(sum[2]),.cout(w[2]),.x(a[2]),.y(b[2]),.cin(w[1]));
	 fulladder g4(.sum(sum[3]),.cout(cout),.x(a[3]),.y(b[3]),.cin(w[2]));
endmodule
