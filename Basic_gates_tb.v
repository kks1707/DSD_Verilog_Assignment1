`timescale 1ns / 1ps
module Basic_gates_tb;
 reg A, B;
    wire and_ga, or_ga, not_ga,  nor_ga, xor_ga, xnor_ga, nand_ga;
    
    Basic_gates UUT (
    .A(A),
    .B(B),
    .and_ga(and_ga),
    .or_ga(or_ga),
    .not_ga(not_ga),
    .nor_ga(nor_ga),
    .xor_ga(xor_ga),
    .xnor_ga(xnor_ga),
    .nand_ga(nand_ga)

    );
    initial begin
        $monitor("Time=%0t | A=%b B=%b | AND=%b OR=%b NOT(A)=%b NOR=%b XOR=%b XNOR=%b NAND=%b",
                 $time, A, B, and_ga, or_ga, not_ga, nor_ga, xor_ga, xnor_ga, nand_ga);

        A = 0; B = 0; #10; 
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end
endmodule
