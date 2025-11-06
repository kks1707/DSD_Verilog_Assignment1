`timescale 1ns / 1ps
module Boolean_expression(
output Y, input A, B, C);

    assign Y = (A & B) | (~A & C);
endmodule
