module vending_machine_tb;

reg clock;
reg reset;
reg [3:0] money;
reg [1:0] selection;
wire [3:0] product;
wire [3:0] change;

vending_machine dut(
    .product(product),
    .change(change),
    .money(money),
    .selection(selection),
    .clock(clock),
    .reset(reset)
);

initial begin
    clock = 0;
    reset = 1;
    money = 4'd0;
    selection = 2'd0;
    #10 reset = 0;
    forever #5 clock = ~clock;
end

initial begin
    #20 money = 4'd10;
    selection = 2'b00;               
        
    $display("Product: %d, Change: %d", product, change);
                     
    selection = 2'd0;
    #20 money = 4'd6;
    selection = 2'b10; // select Soda
    #20;
    $display("Product: %d, Change: %d", product, change);
    #100 $finish;
end

endmodule