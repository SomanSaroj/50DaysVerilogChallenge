`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:49 05/08/2025 
// Design Name: 
// Module Name:    mux_4x1 
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
module mux_4x1(y, s, i);
    output reg y;
    input [1:0] s;
    input [3:0] i;
	 
	 always @( s or i) begin
		case(s)
			2'b00: y=i[0];
			2'b01: y=i[1];
			2'b10: y=i[2];
			2'b11: y=i[3];
			default: y=1'bz;
		endcase
	end
endmodule
