`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:19 05/09/2025 
// Design Name: 
// Module Name:    demux_1x2 
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
module demux_1x2(y, s, i);
    output [1:0] y;
    input s;
    input i;
	 assign y[0] = ~s& i;
    assign y[1] = s & i;


endmodule
