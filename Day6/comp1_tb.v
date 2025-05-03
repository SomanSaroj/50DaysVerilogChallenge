`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:31 05/03/2025
// Design Name:   comp1
// Module Name:   comp1_tb.v
// Project Name:  Day6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comp1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comp1_tb_v;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire E;
	wire G;
	wire L;

	// Instantiate the Unit Under Test (UUT)
	comp1 uut (
		.E(E), 
		.G(G), 
		.L(L), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		
		#5 a=1;b=0;
		#5 a=1;b=1;
		#5 a=0;b=1;
		

	end
	initial $monitor("[%0d] a=%b b=%b G=%b E=%b L=%b",$time,a,b,G,E,L);
	initial #16 $finish; 
      
endmodule

