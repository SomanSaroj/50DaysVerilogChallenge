`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 21:25:49
// Design Name: 
// Module Name: sync_fifo_tb
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


`timescale 1ns/1ps

module sync_fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg clk, rst, wr_en, rd_en;
    reg [DATA_WIDTH-1:0] wr_data;
    wire [DATA_WIDTH-1:0] rd_data;
    wire full, empty;

    sync_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .full(full),
        .empty(empty)
    );

    initial clk = 0;
    always #5 clk = ~clk;  // 100MHz

    integer i;

    initial begin
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        wr_data = 0;

        // Release reset
        #20;
        rst = 0;

        // Write 8 values
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            if (!full) begin
                wr_data <= i;
                wr_en <= 1;
            end
        end
        @(posedge clk);
        wr_en <= 0;

        // Wait for a bit
        #30;

        // Read 8 values
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            if (!empty) begin
                rd_en <= 1;
            end
        end
        @(posedge clk);
        rd_en <= 0;

        #50;
        $display("Sync FIFO test complete.");
        $stop;
    end

endmodule

