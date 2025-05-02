`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:39:30 05/02/2025
// Design Name:   fullSubtractor
// Module Name:   fullSubtractor_tb.v
// Project Name:  Day5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullSubtractor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fullSubtractor_tb_v;

	// Inputs
	reg A;
	reg B;
	reg Bin;

	// Outputs
	wire D;
	wire Bout;

	// Instantiate the Unit Under Test (UUT)
	fullSubtractor uut (
		.D(D), 
		.Bout(Bout), 
		.A(A), 
		.B(B), 
		.Bin(Bin)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Bin = 0;
		
	end
	always #1 {A,B,Bin}={A,B,Bin}+1'b1;
	initial $monitor("[%0d] A=%b B=%b Bin=%b D=%b Bout=%b",$time,A,B,Bin,D,Bout);
	initial #8 $finish;
	
      
endmodule

