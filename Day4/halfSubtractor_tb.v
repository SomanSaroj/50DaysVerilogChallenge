`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:42 05/01/2025
// Design Name:   halfSubtractor
// Module Name:   halfSubtractor_tb.v
// Project Name:  Day4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halfSubtractor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module halfSubtractor_tb_v;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	halfSubtractor uut (
		.diff(diff), 
		.borrow(borrow), 
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
	
	//initial $display("\t a\tb\tdiff\tborrow\t");
	initial $monitor("[%0d]\ta=%b b=%b diff=%b borrow=%b",$time,a,b,diff,borrow);
	initial #7 $finish;
      
endmodule

