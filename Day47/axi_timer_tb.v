`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 21:20:30
// Design Name: 
// Module Name: axi_timer_tb
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


module axi_timer_tb;

    reg         ACLK = 0;
    reg         ARESETN;

    reg [3:0]   AWADDR;
    reg         AWVALID;
    wire        AWREADY;

    reg [31:0]  WDATA;
    reg         WVALID;
    wire        WREADY;

    wire [1:0]  BRESP;
    wire        BVALID;
    reg         BREADY;

    reg [3:0]   ARADDR;
    reg         ARVALID;
    wire        ARREADY;

    wire [31:0] RDATA;
    wire [1:0]  RRESP;
    wire        RVALID;
    reg         RREADY;

    wire        interrupt;

    axi_timer dut (
        .ACLK(ACLK),
        .ARESETN(ARESETN),
        .AWADDR(AWADDR),
        .AWVALID(AWVALID),
        .AWREADY(AWREADY),
        .WDATA(WDATA),
        .WVALID(WVALID),
        .WREADY(WREADY),
        .BRESP(BRESP),
        .BVALID(BVALID),
        .BREADY(BREADY),
        .ARADDR(ARADDR),
        .ARVALID(ARVALID),
        .ARREADY(ARREADY),
        .RDATA(RDATA),
        .RVALID(RVALID),
        .RREADY(RREADY),
        .RRESP(RRESP),
        .interrupt(interrupt)
    );

    always #5 ACLK = ~ACLK;

    task axi_write(input [3:0] addr, input [31:0] data);
        begin
            @(posedge ACLK);
            AWADDR = addr;
            AWVALID = 1;
            WDATA = data;
            WVALID = 1;
            BREADY = 1;
            wait (AWREADY && WREADY);
            @(posedge ACLK);
            AWVALID = 0;
            WVALID = 0;
            wait (BVALID);
            @(posedge ACLK);
            BREADY = 0;
        end
    endtask

    task axi_read(input [3:0] addr);
        begin
            @(posedge ACLK);
            ARADDR = addr;
            ARVALID = 1;
            RREADY = 1;
            wait (ARREADY);
            @(posedge ACLK);
            ARVALID = 0;
            wait (RVALID);
            $display("Read @ %h = %h", addr, RDATA);
            @(posedge ACLK);
            RREADY = 0;
        end
    endtask

    initial begin
        $display("Starting AXI Timer Test...");
        $dumpfile("axi_timer.vcd");
        $dumpvars(0, axi_timer_tb);

        ARESETN = 0;
        AWADDR = 0;
        AWVALID = 0;
        WDATA = 0;
        WVALID = 0;
        BREADY = 0;
        ARADDR = 0;
        ARVALID = 0;
        RREADY = 0;

        #20;
        ARESETN = 1;

        // Set target to 20
        axi_write(4'h8, 32'd20);

        // Start timer
        axi_write(4'h0, 32'b1); // start = 1

        // Wait some cycles
        repeat (25) @(posedge ACLK);

        // Read count
        axi_read(4'h4);

        // Check interrupt
        $display("Interrupt = %b", interrupt);

        // Clear timer
        axi_write(4'h0, 32'b10); // clear = 1

        @(posedge ACLK);
        $finish;
    end

endmodule
