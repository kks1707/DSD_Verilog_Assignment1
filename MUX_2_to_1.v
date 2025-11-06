`timescale 1ns / 1ps
module MUX_2_to_1(
output reg Y,       
    input D0, D1,       
    input S0
    );
    always @(*) begin
    case (S0)
        1'b0: Y = D0;    // Selects D0 when S0 = 0
        1'b1: Y = D1;    // Selects D1 when S0 = 1
    endcase
end
endmodule
