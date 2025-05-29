`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 22:58:08
// Design Name: 
// Module Name: booth_multiplier_tb
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


module booth_multiplier_tb();
reg signed [3:0] multiplicand;
    reg signed [3:0] multiplier;
    wire signed [7:0] product;

    booth_multiplier uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product) );
  
    reg clk, reset;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; multiplicand = 0; multiplier = 0;
        #10 reset = 0;

        #10 multiplicand = 4'sd3; multiplier = 4'sd2;   //  3 * 2 = 6
        #10 multiplicand = -4'sd4; multiplier = 4'sd3;  // -4 * 3 = -12
        #10 multiplicand = -4'sd3; multiplier = -4'sd2; // -3 * -2 = 6
        #10 multiplicand = 4'sd7; multiplier = -4'sd1;  //  7 * -1 = -7
        #10 multiplicand = -4'sd8; multiplier = -4'sd8; // -8 * -8 = 64
    end
    initial $monitor("Time=%0d | multiplicand=%d | multiplier=%d | product=%d",$time, multiplicand, multiplier, product);
                     
    initial #100 $finish;
endmodule
