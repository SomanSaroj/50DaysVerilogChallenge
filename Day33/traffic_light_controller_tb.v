module traffic_light_controller_tb;

reg clock;
reg reset;
wire red;
wire yellow;
wire green;

traffic_light_controller dut(
    .red(red),
    .yellow(yellow),
    .green(green),
    .clock(clock),
    .reset(reset)
);

initial begin
    clock = 0;
    reset = 1;
    #10 reset = 0;
    forever #5 clock = ~clock;
end

initial begin
    #200 $finish;
end

initial begin
    $monitor("Time: %0t, Red: %b, Yellow: %b, Green: %b", $time, red, yellow, green);
end

endmodule