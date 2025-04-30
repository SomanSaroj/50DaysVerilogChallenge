`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:38:15 04/30/2025
// Design Name:   fullAdder
// Module Name:   fullAdder_tb.v
// Project Name:  Day3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fullAdder_tb_v;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	fullAdder uut (
		.sum(sum), 
		.carry(carry), 
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial {a,b,c}=3'b000;
	always #1 {a,b,c}={a,b,c}+1'b1;
	
	//initial $display("\ta b c  sum carry");
	initial $monitor("[%0d] input =  %b %b %b   carry = %b sum = %b",$time,a,b,c,carry,sum);
	initial #8 $finish;
      
endmodule

