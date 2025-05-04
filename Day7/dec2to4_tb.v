`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:39:49 05/04/2025
// Design Name:   dec2to4
// Module Name:   dec2to4_tb.v
// Project Name:  Day7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dec2to4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dec2to4_tb_v;

	// Inputs
	reg [1:0] x;

	// Outputs
	wire [3:0] y;

	// Instantiate the Unit Under Test (UUT)
	dec2to4 uut (
		.y(y), 
		.x(x)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		#5 x=1;
		#5 x=2;
		#5 x=3;

	end
	initial $monitor("[%0d] x=%b y=%b",$time,x,y);
	initial #18 $finish;
      
endmodule

