`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2025 22:41:08
// Design Name: 
// Module Name: d_flipflop_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module d_flipflop_tb();
   reg clk,D;
   wire Qn,Q;
   d_flipflop dut(.Qn(Qn),.Q(Q),.clk(clk),.D(D));
   initial clk = 1'b0;
   initial D=1'b0;
   always #2 clk=~clk;
   always #4 D=~D;
   initial $monitor("clk= %b, D= %b, Q= %b, Qn= %d",clk,D,Q,Qn);
   initial #10 $finish;
   

    
endmodule
