`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:42 05/01/2025 
// Design Name: 
// Module Name:    halfSubtractor 
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
module halfSubtractor(diff, borrow, a, b);
    output diff;
    output borrow;
    input a;
    input b;
	 
	 assign diff= a^b;
	 assign borrow= ( (~a) & b );


endmodule
