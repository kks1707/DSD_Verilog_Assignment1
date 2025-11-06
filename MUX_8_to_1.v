`timescale 1ns / 1ps
module MUX_8_to_1(
output reg Y,           // MUX Output
    input [7:0] D,          // 8-bit Data Bus D[7]...D[0]
    input [2:0] S
    );
    always @(D or S) begin
    Y = D[S]; // This is the simplest and most synthesizable way!
end
endmodule
