`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 19:29:00
// Design Name: 
// Module Name: alu_tb
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
module alu_tb(

    );
    reg [1:0] op;
    reg [3:0] a,b;
    wire [3:0]y;
    wire cout;
    
    alu dut ( .y(y), .cout(cout), .op(op), .a(a), .b(b) );
    
    initial begin 
        a=0;b=0;op=1;
        #5 a=7;b=5; op=1;
        #5 a=4;b=3; op=0;
        
     end
     initial $monitor("time=[%0d] a=%b b=%b op=%b cout=%b y=%b",$time,a,b,op,cout,y);
     initial #15 $finish;
        
endmodule
