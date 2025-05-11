`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:18:10 05/11/2025
// Design Name:   carry_look_ahead_adder
// Module Name:   carry_look_ahead_adder_tb.v
// Project Name:  Day14
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carry_look_ahead_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module carry_look_ahead_adder_tb_v;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	carry_look_ahead_adder uut (
		.sum(sum), 
		.cout(cout), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 4'b0010;
		b = 4'b0101;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#10 a=4'b1010;
		b=4'b1111;
		cin=0;
        
		// Add stimulus here

	end
	initial $monitor("a=%b  ,b=%b  ,cin=%b  ,sum=%b  ,cout=%b",a,b,cin,sum,cout);
	initial#20 $finish;
      
endmodule

