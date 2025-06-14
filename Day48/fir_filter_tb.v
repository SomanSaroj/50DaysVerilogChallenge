`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2025 22:10:13
// Design Name: 
// Module Name: fir_filter_tb
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


module fir_filter_tb;

    reg clk;
    reg rst;
    reg signed [15:0] sample_in;
    wire signed [31:0] sample_out;

    // Instantiate the DUT
    fir_filter #(.N(4)) dut (
        .clk(clk),
        .rst(rst),
        .sample_in(sample_in),
        .sample_out(sample_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Declare loop index globally for ISE compatibility
    integer i;

    // Declare input sample array
    reg signed [15:0] test_samples [0:19];

    initial begin
        $dumpfile("fir_filter.vcd");
        $dumpvars(0, fir_filter_tb);
        // Define test samples
        test_samples[0]  = 0;
        test_samples[1]  = 0;
        test_samples[2]  = 0;
        test_samples[3]  = 0;
        test_samples[4]  = 16'sd10;
        test_samples[5]  = 16'sd10;
        test_samples[6]  = 16'sd10;
        test_samples[7]  = 16'sd10;
        test_samples[8]  = 0;
        test_samples[9]  = 0;
        test_samples[10] = 0;
        test_samples[11] = 0;
        test_samples[12] = -16'sd10;
        test_samples[13] = -16'sd10;
        test_samples[14] = -16'sd10;
        test_samples[15] = -16'sd10;
        test_samples[16] = 0;
        test_samples[17] = 0;
        test_samples[18] = 0;
        test_samples[19] = 0;
        // Reset the filter
        rst = 1;
        sample_in = 0;
        #20;
        rst = 0;
        // Apply inputs one by one
        for (i = 0; i < 20; i = i + 1) begin
            sample_in = test_samples[i];
            #10;
        end

        #100;
        $finish;
    end

endmodule
