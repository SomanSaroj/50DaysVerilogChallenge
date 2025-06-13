`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 21:19:54
// Design Name: 
// Module Name: axi_timer
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


module axi_timer(
    ACLK, ARESETN,
    AWADDR, AWVALID, AWREADY,
    WDATA, WVALID, WREADY,
    BRESP, BVALID, BREADY,
    ARADDR, ARVALID, ARREADY,
    RDATA, RVALID, RREADY, RRESP,
    interrupt
);

    input wire ACLK, ARESETN;
    input wire [3:0] AWADDR;
    input wire AWVALID;
    output reg AWREADY;
    
    input wire [31:0] WDATA;
    input wire WVALID;
    output reg WREADY;

    output reg [1:0] BRESP;
    output reg BVALID;
    input wire BREADY;

    input wire [3:0] ARADDR;
    input wire ARVALID;
    output reg ARREADY;

    output reg [31:0] RDATA;
    output reg RVALID;
    input wire RREADY;
    output reg [1:0] RRESP;
    output reg interrupt;
    // Address map
    localparam ADDR_CTRL   = 4'h0; // control
    localparam ADDR_COUNT  = 4'h4; // current count
    localparam ADDR_TARGET = 4'h8; // target count

    reg start;
    reg clear;
    reg [31:0] count;
    reg [31:0] target;
    // AXI Write
    always @(posedge ACLK) begin
        if (!ARESETN) begin
            AWREADY <= 0;
            WREADY  <= 0;
            BVALID  <= 0;
            BRESP   <= 2'b00;
        end else begin
            if (AWVALID && !AWREADY) AWREADY <= 1;
            else AWREADY <= 0;
            if (WVALID && !WREADY) WREADY <= 1;
            else WREADY <= 0;
            if (AWVALID && AWREADY && WVALID && WREADY) begin
                case (AWADDR)
                    ADDR_CTRL: begin
                        start <= WDATA[0];
                        clear <= WDATA[1];
                    end
                    ADDR_TARGET: target <= WDATA;
                    default: ;
                endcase
                BVALID <= 1;
                BRESP <= 2'b00;
            end else if (BVALID && BREADY) begin
                BVALID <= 0;
            end
        end
    end
    // AXI Read
    always @(posedge ACLK) begin
        if (!ARESETN) begin
            ARREADY <= 0;
            RVALID  <= 0;
            RDATA   <= 0;
            RRESP   <= 2'b00;
        end else begin
            if (ARVALID && !ARREADY) ARREADY <= 1;
            else ARREADY <= 0;

            if (ARVALID && ARREADY && !RVALID) begin
                case (ARADDR)
                    ADDR_CTRL:   RDATA <= {30'd0, clear, start};
                    ADDR_COUNT:  RDATA <= count;
                    ADDR_TARGET: RDATA <= target;
                    default:     RDATA <= 32'hDEADBEEF;
                endcase
                RVALID <= 1;
                RRESP <= 2'b00;
            end else if (RVALID && RREADY) begin
                RVALID <= 0;
            end
        end
    end
    // Timer logic
    always @(posedge ACLK) begin
        if (!ARESETN || clear) begin
            count <= 0;
            interrupt <= 0;
        end else if (start) begin
            if (count < target) begin
                count <= count + 1;
                interrupt <= 0;
            end else begin
                interrupt <= 1;
            end
        end
    end
endmodule
