module axi4_lite_slave_tb;

    reg ACLK = 0;
    reg ARESETN = 0;

    reg [31:0] AWADDR = 0;
    reg AWVALID = 0;
    wire AWREADY;

    reg [31:0] WDATA = 0;
    reg [3:0]  WSTRB  = 4'hF;
    reg WVALID = 0;
    wire WREADY;

    wire [1:0] BRESP;
    wire BVALID;
    reg BREADY = 0;

    reg [31:0] ARADDR = 0;
    reg ARVALID = 0;
    wire ARREADY;

    wire [31:0] RDATA;
    wire [1:0] RRESP;
    wire RVALID;
    reg RREADY = 0;

    // Instantiate DUT
    axi4_lite_slave dut (
        .ACLK(ACLK),
        .ARESETN(ARESETN),
        .AWADDR(AWADDR),
        .AWVALID(AWVALID),
        .AWREADY(AWREADY),
        .WDATA(WDATA),
        .WSTRB(WSTRB),
        .WVALID(WVALID),
        .WREADY(WREADY),
        .BRESP(BRESP),
        .BVALID(BVALID),
        .BREADY(BREADY),
        .ARADDR(ARADDR),
        .ARVALID(ARVALID),
        .ARREADY(ARREADY),
        .RDATA(RDATA),
        .RRESP(RRESP),
        .RVALID(RVALID),
        .RREADY(RREADY)
    );

    // Clock generation
    always #5 ACLK = ~ACLK;

    initial begin
        $display("Starting AXI4-Lite Slave Test...");
        $dumpfile("axi4_lite.vcd");

        #21;
        $dumpvars(0, axi4_lite_slave_tb);

        // Deassert reset
        ARESETN = 1;

        // Write operation
        @(posedge ACLK);
        AWADDR  = 32'h00000000;
        AWVALID = 1;
        WDATA   = 32'hCAFEBABE;
        WVALID  = 1;
        BREADY  = 1;

        @(posedge ACLK);
        while (!AWREADY || !WREADY) @(posedge ACLK);

        AWVALID = 0;
        WVALID  = 0;

        @(posedge ACLK);
        while (!BVALID) @(posedge ACLK);

        @(posedge ACLK);

        // Read operation
        ARADDR  = 32'h00000000;
        ARVALID = 1;
        RREADY  = 1;

        @(posedge ACLK);
        while (!ARREADY) @(posedge ACLK);

        ARVALID = 0;

        @(posedge ACLK);
        while (!RVALID) @(posedge ACLK);

        $display("Read Data = %h", RDATA);

        #20;
        $finish;
    end

endmodule