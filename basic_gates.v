`timescale 1ns / 1ps
module Basic_gates(
input A,
input B,
output and_ga,
output or_ga,
output not_ga,
output nor_ga,
output xor_ga,
output xnor_ga,
output nand_ga

    );
    assign and_ga  = A & B;     
    assign or_ga   = A | B;    
    assign not_ga  = ~A;        
    assign nor_ga  = ~(A | B);  
    assign xor_ga  = A ^ B;     
    assign xnor_ga = ~(A ^ B);  
    assign nand_ga = ~(A & B);

endmodule
