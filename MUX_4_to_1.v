`timescale 1ns / 1ps

module MUX_4_to_1(
output reg Y,           // MUX Output
    input D0, D1, D2, D3,   // Data Inputs
    input S1, S0
    );
    wire [1:0] S = {S1, S0}; 

always @(*) begin
    case (S)
        2'b00: Y = D0;    // S=0: Selects D0
        2'b01: Y = D1;    // S=1: Selects D1
        2'b10: Y = D2;    // S=2: Selects D2
        2'b11: Y = D3;    // S=3: Selects D3
    endcase
end
endmodule
