`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:56:04 05/09/2025
// Design Name:   demux_1x2
// Module Name:   demux_1x2_tb.v
// Project Name:  Day12
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: demux_1x2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module demux_1x2_tb_v;

	// Inputs
	reg s;
	reg i;

	// Outputs
	wire [1:0] y;

	// Instantiate the Unit Under Test (UUT)
	demux_1x2 uut (
		.y(y), 
		.s(s), 
		.i(i)
	);

	initial begin
		// Initialize Inputs
		s = 0;
		i = 0;
		

	end
	always #2 s=s+1;
	always #1 i=~i;
	
	initial #15 $finish;
	
      
endmodule

