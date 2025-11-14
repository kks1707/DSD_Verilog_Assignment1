`timescale 1ns/1ps
module Universal_Adder_tb;
reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Cout;
Universal_Adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);
initial begin
    $display("Time\tA\tB\tCin\t|\tSum\tCout");
    $monitor("%0dns\t%b\t%b\t%b\t|\t%b\t%b", $time, A, B, Cin, Sum, Cout);
    Cin = 0; A = 4'b0000; B = 4'b0000; #10;
    A = 4'b0101; B = 4'b0011; #10;   
    A = 4'b1001; B = 4'b0110; #10;   
    A = 4'b1111; B = 4'b0001; #10;   
    Cin = 1; A = 4'b0010; B = 4'b0100; #10; 
    $finish;
end
endmodule
