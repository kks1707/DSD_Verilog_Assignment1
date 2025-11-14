`timescale 1ns/1ps
module sr_ff_tb;
reg S;
reg R;
reg clk;
wire Q;
wire Qbar;
sr_ff uut (
    .S(S),
    .R(R),
    .clk(clk),
    .Q(Q),
    .Qbar(Qbar)
);
always #5 clk = ~clk;
initial begin
    clk = 0;
    S = 0; R = 0;
    $display("Time\tS\tR\tQ\tQbar");
    $monitor("%g\t%b\t%b\t%b\t%b", $time, S, R, Q, Qbar);
    #10 S = 0; R = 0;   
    #10 S = 1; R = 0;   
    #10 S = 0; R = 1;   
    #10 S = 0; R = 0;   
    #10 S = 1; R = 1;   
    #10 S = 0; R = 0;   
    #20 $finish;
end
endmodule
