`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 21:34:49
// Design Name: 
// Module Name: sr_flipflop_tb
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


module sr_flipflop_tb(

    );
    reg clk,S,R;
    wire Q,Qn;
    
    sr_flipflop dut (.Q(Q) , .Qn(Qn), .clk(clk), .S(S), .R(R) );
    
    initial begin
        clk = 1'b0; {S,R}=2'b10;
        #10 {S,R}=2'b10;
        #10 {S,R}=2'b01;
        #10 {S,R}=2'b11;
    end
    always #10 clk = ~clk;
    initial $monitor("time=[%0d] clk = %b, S = %b, R = %b,  Q = %b, Qn = %b",$time,clk,S,R,Q,Qn);
    initial #40 $finish;
    
endmodule
