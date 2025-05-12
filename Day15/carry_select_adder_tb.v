`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 21:27:13
// Design Name: 
// Module Name: carry_select_adder_tb
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


module carry_select_adder_tb(

    );
    
        reg [3:0]x,y;
        reg Cin;
        wire [3:0]Sum;
        wire Cout;
        
        carry_select_adder dut (.Sum(Sum),.Cout(Cout),.x(x),.y(y),.Cin(Cin) );
        
        initial begin 
            x=0;y=0;Cin=0;
            #10 x=5;y=4;Cin=1;
            #10 x=3;y=3;Cin=1;
            end
            initial $monitor("time=[%0d] x=%b y=%b Cin=%b Cout=%b Sum=%b ",$time,x,y,Cin,Cout,Sum);
            initial #36 $finish; 
endmodule
