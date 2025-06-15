`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 20:07:56
// Design Name: 
// Module Name: async_fifo_tb
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


module async_fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;
    parameter DEPTH = 1 << ADDR_WIDTH;

    // Signals
    reg wr_clk, wr_rst, wr_en;
    reg rd_clk, rd_rst, rd_en;
    reg [DATA_WIDTH-1:0] wr_data;
    wire [DATA_WIDTH-1:0] rd_data;
    wire full, empty;

    // Instantiate the FIFO
    async_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .wr_clk(wr_clk),
        .wr_rst(wr_rst),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .full(full),

        .rd_clk(rd_clk),
        .rd_rst(rd_rst),
        .rd_en(rd_en),
        .rd_data(rd_data),
        .empty(empty)
    );

    // Write clock (fast)
    initial wr_clk = 0;
    always #5 wr_clk = ~wr_clk;  // 100MHz

    // Read clock (slow)
    initial rd_clk = 0;
    always #12 rd_clk = ~rd_clk;  // ~41.6MHz

    integer i;

    initial begin
        // Initialize signals
        wr_rst = 1;
        rd_rst = 1;
        wr_en = 0;
        rd_en = 0;
        wr_data = 0;

        // Release reset
        #20;
        wr_rst = 0;
        rd_rst = 0;

        // Write 10 values into FIFO
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge wr_clk);
            if (!full) begin
                wr_data <= i;
                wr_en <= 1;
            end
        end
        @(posedge wr_clk);
        wr_en <= 0;

        // Wait for some time
        #50;

        // Read 10 values from FIFO
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge rd_clk);
            if (!empty) begin
                rd_en <= 1;
            end
        end
        @(posedge rd_clk);
        rd_en <= 0;

        // Finish simulation
        #100;
        $display("Test completed.");
        $stop;
    end

endmodule

