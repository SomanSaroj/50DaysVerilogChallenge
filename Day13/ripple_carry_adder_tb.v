`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:04 05/10/2025
// Design Name:   ripple_carry_adder
// Module Name:   ripple_carry_adder_tb.v
// Project Name:  Day13
// Target Device:  
// Tool versions:  
// Description: 
//
module ripple_carry_adder_tb_v;
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_adder uut (
		.sum(sum), 
		.cout(cout), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);
   
	initial begin
	a=1010;
	b=0101;
	cin=1;
	#10 a=1111;
	b=1010;
	cin=0;
	end
	initial $monitor("a=%b  ,b=%b  ,cin=%b  ,sum=%b  ,cout=%b",a,b,cin,sum,cout);
	initial #20 $finish;
      
endmodule

