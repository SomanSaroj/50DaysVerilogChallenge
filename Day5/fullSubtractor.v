`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:48 05/02/2025 
// Design Name: 
// Module Name:    fullSubtractor 
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
module fullSubtractor(D , Bout, A, B, Bin);
    output D ;
    output Bout;
    input A;
    input B;
    input Bin;
	 assign D = A ^ B ^ Bin;  // Difference
    assign Bout = (~A & B) | (~A & Bin) | (B & Bin);  //Borrow Out


endmodule
