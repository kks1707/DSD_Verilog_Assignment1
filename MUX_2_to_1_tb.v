`timescale 1ns / 1ps

module MUX_2_to_1_tb;
reg D0, D1, S0;
    wire Y;
    
  MUX_2_to_1 dut (
        .Y(Y),
        .D0(D0),
        .D1(D1),
        .S0(S0)
    );
    initial begin
        // Apply test vectors
        $dumpfile("MUX_2_to_1.vcd");
        $dumpvars(0, MUX_2_to_1_tb);
        
        $monitor("Time=%0t | S0=%b | D0=%b, D1=%b | Y=%b", $time, S0, D0, D1, Y);
        
        // Test 1: S0 = 0 (Y should follow D0)
        S0 = 0; D0 = 1; D1 = 0; #10;
        S0 = 0; D0 = 0; D1 = 1; #10;
        
        // Test 2: S0 = 1 (Y should follow D1)
        S0 = 1; D0 = 0; D1 = 1; #10;
        S0 = 1; D0 = 1; D1 = 0; #10;
        
        $finish;
    end
endmodule
