module i2c_tb;

    reg clk;
    reg rst;
    reg start;
    wire scl;
    wire sda;
    wire busy;
    wire done;

    i2c_master uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .scl(scl),
        .sda(sda),
        .busy(busy),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        rst = 1;
        start = 0;

        #100;
        rst = 0;

        #100;
        start = 1;
        #20;
        start = 0;

        wait (done == 1);

        #100;

        $finish;
    end

endmodule