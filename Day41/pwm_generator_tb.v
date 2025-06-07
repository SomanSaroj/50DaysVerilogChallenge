`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module pwm_generator_tb;

reg clk;
reg [7:0] duty_cycle;
reg [7:0] period;
wire pwm_out;

pwm_generator dut(
    .pwm_out(pwm_out),
    .clk(clk),
    .duty_cycle(duty_cycle),
    .period(period)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    duty_cycle = 8'd50; // 50% duty cycle
    period = 8'd100; // period of 100 clock cycles
    #1000 $finish;
end

endmodule
