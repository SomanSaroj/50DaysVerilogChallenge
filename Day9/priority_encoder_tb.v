`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:18:16 05/06/2025
// Design Name:   priority_encoder
// Module Name:   priority_encoder_tb.v
// Project Name:  Day9
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: priority_encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module priority_encoder_tb_v;

	// Inputs
	reg [3:0] a;

	// Outputs
	wire [1:0] y;

	// Instantiate the Unit Under Test (UUT)
	priority_encoder uut (
		.y(y), 
		.a(a)
	);

	initial begin
		// Initialize Inputs
		
		 a=1;
		#5 a=2;
		#5 a=4;
		#5 a=8;
		

	end
	initial $monitor("[%0d] a=%b y=%b",$time,a,y);
	initial #35 $finish;
      
endmodule

