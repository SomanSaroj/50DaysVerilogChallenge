`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2025 21:09:11
// Design Name: 
// Module Name: jk_flipflop_tb
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


module jk_flipflop_tb(

    );
    reg clk,J,K;
        wire Q,Qn;
        
        jk_flipflop dut (.Q(Q) , .Qn(Qn), .clk(clk), .J(J), .K(K) );
        
        initial begin
            clk = 1'b0; {J,K}=2'b10;
            #10 {J,K}=2'b10;
            #10 {J,K}=2'b01;
            #10 {J,K}=2'b11;
        end
        always #10 clk = ~clk;
        initial $monitor("time=[%0d] clk = %b, J = %b, K = %b,  Q = %b, Qn = %b",$time,clk,J,K,Q,Qn);
        initial #40 $finish;
endmodule
