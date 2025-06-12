`timescale 1ns / 1ps


module axi4_lite_slave (
    ACLK,
    ARESETN,
    AWADDR, AWVALID, AWREADY,
    WDATA, WSTRB, WVALID, WREADY,
    BRESP, BVALID, BREADY,
    ARADDR, ARVALID, ARREADY,
    RDATA, RRESP, RVALID, RREADY
);

    input wire ACLK;
    input wire ARESETN;

    // Write Address Channel
    input wire [31:0] AWADDR;
    input wire AWVALID;
    output reg AWREADY;

    // Write Data Channel
    input wire [31:0] WDATA;
    input wire [3:0] WSTRB;
    input wire WVALID;
    output reg WREADY;

    // Write Response Channel
    output reg [1:0] BRESP;
    output reg BVALID;
    input wire BREADY;

    // Read Address Channel
    input wire [31:0] ARADDR;
    input wire ARVALID;
    output reg ARREADY;

    // Read Data Channel
    output reg [31:0] RDATA;
    output reg [1:0] RRESP;
    output reg RVALID;
    input wire RREADY;

    // Internal register map
    reg [31:0] reg0;

    // Initialization
    initial begin
        AWREADY = 0;
        WREADY  = 0;
        BVALID  = 0;
        BRESP   = 2'b00;
        ARREADY = 0;
        RVALID  = 0;
        RRESP   = 2'b00;
        RDATA   = 32'd0;
        reg0    = 32'd0;
    end

    // Write FSM
    always @(posedge ACLK) begin
        if (!ARESETN) begin
            AWREADY <= 0;
            WREADY  <= 0;
            BVALID  <= 0;
            BRESP   <= 2'b00;
        end else begin
            AWREADY <= AWVALID && !AWREADY;
            WREADY  <= WVALID && !WREADY;

            if (AWREADY && AWVALID && WREADY && WVALID) begin
                if (AWADDR[7:0] == 8'h00) begin
                    reg0 <= WDATA;
                end
                BVALID <= 1;
                BRESP  <= 2'b00;
            end else if (BVALID && BREADY) begin
                BVALID <= 0;
            end
        end
    end

    // Read FSM
    always @(posedge ACLK) begin
        if (!ARESETN) begin
            ARREADY <= 0;
            RVALID  <= 0;
            RRESP   <= 2'b00;
            RDATA   <= 32'd0;
        end else begin
            ARREADY <= ARVALID && !ARREADY;

            if (ARREADY && ARVALID && !RVALID) begin
                case (ARADDR[7:0])
                    8'h00: RDATA <= reg0;
                    default: RDATA <= 32'hDEADBEEF;
                endcase
                RVALID <= 1;
                RRESP  <= 2'b00;
            end else if (RVALID && RREADY) begin
                RVALID <= 0;
            end
        end
    end
endmodule