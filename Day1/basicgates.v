`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:47 04/28/2025 
// Design Name: 
// Module Name:    basicgates 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module basicgates(AND, OR, NOT, NAND, NOR, XOR, a, b);
    output AND;
    output OR;
    output NOT;
    output NAND;
    output NOR;
    output XOR;
    input a;
    input b;
	 
  and g1(AND,a,b);
  or g2(OR,a,b);
  not g3(NOT,a);
  nand g4(NAND,a,b);
  nor g5(NOR,a,b);
  xor g6(XOR,a,b);


endmodule
