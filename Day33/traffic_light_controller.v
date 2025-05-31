module traffic_light_controller(
    output reg red,
    output reg yellow,
    output reg green,
    input clock,
    input reset
);

parameter RED_TIME = 4'd10;                      
parameter YELLOW_TIME = 4'd5; // Yellow light duration
parameter GREEN_TIME = 4'd10;                        

reg [2:0] state;                               
reg [3:0] timer;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        state = 0;
        timer = 0;
        red = 1'b1;
        yellow = 1'b0;
        green = 1'b0;
    end else begin
        case (state)
            0: begin // Red state
                red = 1'b1;
                yellow = 1'b0;
                green = 1'b0;
                if (timer == RED_TIME) begin
                    state = 1;
                    timer = 0;
                end else begin
                    timer = timer + 1;
                end
            end
            1: begin               
                red = 1'b0;
                yellow = 1'b0;
                green = 1'b1;
                if (timer == GREEN_TIME) begin
                    state = 2;
                    timer = 0;
                end else begin
                    timer = timer + 1;
                end
            end
            2: begin // Yellow state
                red = 1'b0;
                yellow = 1'b1;
                green = 1'b0;
                if (timer == YELLOW_TIME) begin
                    state = 0;
                    timer = 0;
                end else begin
                    timer = timer + 1;
                end
            end
            default: state = 0;
        endcase
    end
end

endmodule