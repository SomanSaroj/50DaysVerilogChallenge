`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2025 22:09:09
// Design Name: 
// Module Name: fir_filter
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


module fir_filter (sample_out,clk,rst,sample_in);
    parameter N = 4;
    input wire clk;
    input wire rst;
    input wire signed [15:0] sample_in;
    output reg signed [31:0] sample_out;
    reg signed [15:0] coeffs [0:N-1];
    reg signed [15:0] samples [0:N-1];
    reg signed [31:0] acc;
    // Declare loop variables
    integer j, k, m;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (j = 0; j < N; j = j + 1) begin
                samples[j] <= 0;
                coeffs[j] <= 0;
            end
            coeffs[0] <= 16'sd2;// Example symmetric coefficients: simple low-pass FIR
            coeffs[1] <= 16'sd4;
            coeffs[2] <= 16'sd4;
            coeffs[3] <= 16'sd2;
            sample_out <= 0;
        end else begin
            // Shift samples
            for (k = N-1; k > 0; k = k - 1) begin
                samples[k] <= samples[k-1];
            end
            samples[0] <= sample_in;
            // Perform convolution
            acc = 0;
            for (m = 0; m < N; m = m + 1) begin
                acc = acc + samples[m] * coeffs[m];
            end
            sample_out <= acc;
        end
    end
endmodule
