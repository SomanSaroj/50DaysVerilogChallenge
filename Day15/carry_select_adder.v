`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 21:23:49
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder(
    output [3:0] Sum,
    output Cout,
    input [3:0] x,
    input [3:0] y,
    input Cin
    );
    
        wire [3:0] sum0,sum1;
        wire [3:0] carry0,carry1;
        wire [3:0] cout0,cout1;
        
        FA FA0_0(sum0[0],cout0[0],x[0],y[0],1'b0);
        FA FA1_0(sum0[1],cout0[1],x[1],y[1],cout0[0]);
        FA FA2_0(sum0[2],cout0[2],x[2],y[2],cout0[1]);
        FA FA3_0(sum0[3],cout0[3],x[3],y[3],cout0[2]);
        
        FA FA0_1(sum1[0],cout1[0],x[0],y[0],1'b1);
        FA FA1_1(sum1[1],cout1[1],x[1],y[1],cout1[0]);
        FA FA2_1(sum1[2],cout1[2],x[2],y[2],cout1[1]);
        FA FA3_1(sum1[3],cout1[3],x[3],y[3],cout1[2]);
        
        
        //MUX
        assign Sum[0]= (Cin==0)?sum0[0]:sum1[0];
        assign Sum[1]= (Cin==0)?sum0[1]:sum1[1];
        assign Sum[2]= (Cin==0)?sum0[2]:sum1[2];
        assign Sum[3]= (Cin==0)?sum0[3]:sum1[3];
        
        assign Cout= (Cin==1'b0)?cout0[3]:cout1[3];
        
        
endmodule
