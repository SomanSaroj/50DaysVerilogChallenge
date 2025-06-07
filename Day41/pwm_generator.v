`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module pwm_generator(
    output reg pwm_out,
    input wire clk,
    input wire [7:0] duty_cycle,
    input wire [7:0] period
);

reg [7:0] counter = 0;

always @(posedge clk) begin
    counter <= counter + 1;
    if (counter >= period) begin
        counter <= 0;
    end
    if (counter < duty_cycle) begin
        pwm_out <= 1'b1;
    end else begin
        pwm_out <= 1'b0;
    end
end

endmodule