`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:48 04/30/2025 
// Design Name: 
// Module Name:    fullAdder 
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
module fullAdder(sum, carry, a, b, c);
    output sum;
    output carry;
    input a;
    input b;
    input c;
	 assign sum=(a^b^c);
	 assign carry=((a&b) | (b&c) | (a&c));


endmodule
