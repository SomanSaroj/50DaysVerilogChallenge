`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:04:09 04/29/2025
// Design Name:   halfAdder
// Module Name:   halfAdder_tb.v
// Project Name:  Day2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halfAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module halfAdder_tb_v;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	halfAdder uut (
		.sum(sum), 
		.carry(carry), 
		.a(a), 
		.b(b)
	);

	initial begin
		
		a = 0;
		b = 0;
		#2 a=0;b=1;
		#2 a=1;b=0;
		#2 a=1;b=1;
	end
	
	initial $display("\t a\tb\tsum\tcarry\t");
	initial $monitor("[%0d]\t%b\t%b\t%b\t%b",$time,a,b,sum,carry);
	initial #7 $finish;
	
      
endmodule

