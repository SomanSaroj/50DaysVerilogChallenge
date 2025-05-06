`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:24 05/06/2025 
// Design Name: 
// Module Name:    priority_encoder 
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
module priority_encoder(y, a);
    output reg [1:0] y;
    input [3:0] a;
	 
	 always @(a)begin
	 
	 casex(a)
	 
		4'b0001: y=2'b00;
		4'b001x: y=2'b01;
		4'b01xx: y=2'b10;
		4'b1xxx: y=2'b11;
		
		
		
		endcase
		
		end 


endmodule
