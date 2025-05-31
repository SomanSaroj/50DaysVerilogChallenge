module vending_machine(
    output reg [3:0] product,
    output reg [3:0] change,
    input [3:0] money,
    input [1:0] selection,
    input clock,
    input reset
);

parameter COKE = 2'b00;
parameter PEPSI = 2'b01;
parameter SODA = 2'b10;
parameter WATER = 2'b11;

parameter COKE_PRICE = 4'd5;
parameter PEPSI_PRICE = 4'd5;
parameter SODA_PRICE = 4'd6;
parameter WATER_PRICE = 4'd4;

reg [3:0] state;
reg [3:0] price;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        state = 4'd0;
        product = 4'd0;
        change = 4'd0;
    end else begin
        case (state)
            0: begin              
                if (money > 0) begin
                    case (selection)
                        COKE: price = COKE_PRICE;
                        PEPSI: price = PEPSI_PRICE;
                        SODA: price = SODA_PRICE;
                        WATER: price = WATER_PRICE;
                        default: price = 4'd0;
                    endcase
                    if (money >= price) begin
                        state = 1;
                    end
                end
            end
            1: begin // dispense product
                case (selection)
                    COKE: product = 4'd1;
                    PEPSI: product = 4'd2;
                    SODA: product = 4'd3;
                    WATER: product = 4'd4;
                    default: product = 4'd0;
                endcase
                change = money - price;
                state = 2;
            end
            2: begin                 
                state = 0;
                product = 4'd0;
                change = 4'd0;
            end
            default: state = 0;
        endcase
    end
end

endmodule