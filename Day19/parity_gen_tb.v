`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 21:58:31
// Design Name: 
// Module Name: parity_gen_tb
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


module parity_gen_tb(

    );
    reg [3:0]x;
    wire y;
    
    parity_gen dut (.y(y), .x(x) );
    
    initial x=0;
    always #2 x=x+1'b1;
    initial $monitor("time=[%0d] x=%b y=%b",$time,x,y);
    initial #15 $finish;
endmodule



