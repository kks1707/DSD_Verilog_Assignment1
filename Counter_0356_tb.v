`timescale 1ns/1ps

module counter_0356_tb();

reg clk;
reg reset;
wire [2:0] count;

counter_0356 dut(
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10;
    reset = 0;

    #200;
    $stop;
end

endmodule