`timescale 1ns / 1ps


module Boolean_expression_tb;
reg A, B, C;
  wire Y;
  Boolean_expression dut (.Y(Y), .A(A), .B(B), .C(C));
initial begin
    $display("A B C | Y");
    $display("-------------");
    A=0; B=0; C=0; #10; $display("%b %b %b | %b", A,B,C,Y);
    A=0; B=0; C=1; #10; $display("%b %b %b | %b", A,B,C,Y);
    A=0; B=1; C=0; #10; $display("%b %b %b | %b", A,B,C,Y);
    A=0; B=1; C=1; #10; $display("%b %b %b | %b", A,B,C,Y);
    A=1; B=0; C=0; #10; $display("%b %b %b | %b", A,B,C,Y);
    A=1; B=0; C=1; #10; $display("%b %b %b | %b", A,B,C,Y);
    A=1; B=1; C=0; #10; $display("%b %b %b | %b", A,B,C,Y);
    A=1; B=1; C=1; #10; $display("%b %b %b | %b", A,B,C,Y);

    $finish;
  end
endmodule
