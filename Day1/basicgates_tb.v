`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:47:05 04/28/2025
// Design Name:   basicgates
// Module Name:   basicgates_tb.v
// Project Name:  Day1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: basicgates
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
module basicgates_tb_v;
	reg a;
	reg b;
	wire AND;
	wire OR;
	wire NOT;
	wire NAND;
	wire NOR;
	wire XOR;

	basicgates uut (
		.AND(AND), 
		.OR(OR), 
		.NOT(NOT), 
		.NAND(NAND), 
		.NOR(NOR), 
		.XOR(XOR), 
		.a(a), 
		.b(b)
	);
	initial {a,b}=2'b00;
   always #5 {a,b}={a,b}+1'b1;
  
  initial $display("\t a b AND OR NOT NAND NOR XOR");  
  initial $monitor("[%0d]\t %b %b  %b\t %b   %b\t %b    %b   %b ",$time,a,b,AND,OR,NOT,NAND,NOR,XOR);
  /*initial begin
  	$dumpfile("basicgates.vcd");
  	$dumpvars(0,basicgates_tb);
  end */ // Uncomment this if vcd is needed
  
  
  initial #18 $finish;     
endmodule

