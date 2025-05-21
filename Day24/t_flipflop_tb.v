`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 21:41:43
// Design Name: 
// Module Name: t_flipflop_tb
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


module t_flipflop_tb(

    );
       reg clk,T;
       wire Qn,Q;
       t_flipflop dut(.Qn(Qn),.Q(Q),.clk(clk),.T(T));
       initial clk = 1'b0;
       initial T=1'b0;
       always #2 clk=~clk;
       always #4 T=~T;
       initial $monitor("clk= %b, T= %b, Q= %b, Qn= %d",clk,T,Q,Qn);
       initial #10 $finish;
endmodule
