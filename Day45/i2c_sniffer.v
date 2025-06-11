//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module i2c_sniffer(start_detected,stop_detected,ack_received,nack_detected,data_valid,data_byte,clk,rst,scl,sda);
    output reg start_detected;
    output reg stop_detected;
    output reg ack_received;
    output reg nack_detected;
    output reg data_valid;
    output reg [7:0] data_byte;
    input wire clk;
    input wire rst;
    input wire scl;
    input wire sda;
    reg scl_prev, sda_prev;
    reg [7:0] shift_reg;
    reg [3:0] bit_count;
    reg in_transfer;

    wire start_cond = (sda_prev == 1 && sda == 0 && scl == 1); // START condition
    wire stop_cond  = (sda_prev == 0 && sda == 1 && scl == 1); // STOP condition

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            scl_prev <= 1;
            sda_prev <= 1;
            bit_count <= 0;
            shift_reg <= 8'd0;
            in_transfer <= 0;

            start_detected <= 0;
            stop_detected <= 0;
            ack_received <= 0;
            nack_detected <= 0;
            data_valid <= 0;
            data_byte <= 8'd0;
        end else begin
            // Save previous SCL and SDA
            scl_prev <= scl;
            sda_prev <= sda;
    
            start_detected <= 0;
            stop_detected  <= 0;
            ack_received   <= 0;
            nack_detected  <= 0;
            data_valid     <= 0;
            if (start_cond) begin
                start_detected <= 1;
                in_transfer <= 1;
                bit_count <= 0;
            end
            if (stop_cond) begin
                stop_detected <= 1;
                in_transfer <= 0;
            end
            // On SCL rising edge
            if (in_transfer && scl_prev == 0 && scl == 1) begin
                if (bit_count < 8) begin
                    shift_reg <= {shift_reg[6:0], sda};
                    bit_count <= bit_count + 1;
                end else begin
                    // ACK/NACK bit
                    if (sda == 0)
                        ack_received <= 1;
                    else
                        nack_detected <= 1;

                    data_byte <= shift_reg;
                    data_valid <= 1;
                    bit_count <= 0;
                end
            end
        end
    end
endmodule