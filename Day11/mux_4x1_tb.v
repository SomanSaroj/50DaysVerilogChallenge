`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:28:19 05/08/2025
// Design Name:   mux_4x1
// Module Name:   mux_4x1_tb.v
// Project Name:  Day11
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_4x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_4x1_tb_v;


	reg [1:0] s;
	reg [3:0] i;

	wire y;

	mux_4x1 uut (
		.y(y), 
		.s(s), 
		.i(i)
	);

	initial begin
		
		s = 0;
		i = 4'b1010;
	end
	always #50 s=s+1'b1;
	initial $monitor("time = [%0d] i=%b s=%b y=%b",$time,i,s,y);
	initial #225 $finish;
endmodule

