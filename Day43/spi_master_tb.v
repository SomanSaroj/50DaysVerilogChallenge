module spi_master_tb;

reg clk;
reg [7:0] data_out;
wire [7:0] data_in;
reg start;
wire done;
reg miso;
wire mosi;
wire sck;
wire cs;

spi_master dut(
    .clk(clk),
    .data_out(data_out),
    .data_in(data_in),
    .start(start),
    .done(done),
    .miso(miso),
    .mosi(mosi),
    .sck(sck),
    .cs(cs)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    start = 0;
    data_out = 8'hA5; // Data to be transmitted
    miso = 0;

    #100;
    start = 1; // Start the transmission

    #20;
    start = 0;

    // Simulate slave sending data
    @(negedge sck) miso = 1; // bit 7
    @(negedge sck) miso = 0; // bit 6
    @(negedge sck) miso = 1; // bit 5
    @(negedge sck) miso = 0; // bit 4
    @(negedge sck) miso = 0; // bit 3
    @(negedge sck) miso = 1; // bit 2
    @(negedge sck) miso = 0; // bit 1
    @(negedge sck) miso = 1; // bit 0

    #100;
    $display("Data transmitted: %h", data_out);
    $display("Data received: %h", data_in);
    $finish;
end

endmodule