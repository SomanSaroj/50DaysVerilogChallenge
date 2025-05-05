`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:02:50 05/05/2025
// Design Name:   encoder8to3
// Module Name:   encoder8to3_tb.v
// Project Name:  Day8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder8to3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module encoder8to3_tb_v;

	// Inputs
	reg [7:0] x;

	// Outputs
	wire [2:0] y;

	// Instantiate the Unit Under Test (UUT)
	encoder8to3 uut (
		.y(y), 
		.x(x)
	);

	initial begin
		x=8'b0000_0001;
	end
	always #5 x=x<<1'b1;
	initial $monitor("[%0d] x=%b y=%b",$time,x,y);
	initial #39 $finish;
      
endmodule

