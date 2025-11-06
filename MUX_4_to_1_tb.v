`timescale 1ns / 1ps


module MUX_4_to_1_tb;
reg D0, D1, D2, D3; 
    reg S1, S0;         
    wire Y;
    MUX_4_to_1 dut (
        .Y(Y),
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .S1(S1),
        .S0(S0)             
    );
    initial begin
        // Initialize inputs
        D0 = 0; D1 = 0; D2 = 0; D3 = 0;
        S1 = 0; S0 = 0;
        
        // Setup waveform dumping for viewing results in Vivado/simulator
        $dumpfile("MUX_4_to_1.vcd");
        $dumpvars(0, MUX_4_to_1_tb);
        
        // Display header
        $display("Time | S1 S0 | D0 D1 D2 D3 | Y");
        $display("---------------------------------");
        
        // Monitor current signal values (prints to console on change)
        $monitor("%0t | %b%b | %b %b %b %b | %b", 
                 $time, S1, S0, D0, D1, D2, D3, Y);
        
        // 1. Select D0 (S = 00)
        S1 = 0; S0 = 0;
        D0 = 1; D1 = 0; D2 = 0; D3 = 0; #10; // Y should be 1
        D0 = 0; D1 = 1; D2 = 1; D3 = 1; #10; // Y should be 0

        // 2. Select D1 (S = 01)
        S1 = 0; S0 = 1;
        D0 = 0; D1 = 1; D2 = 0; D3 = 0; #10; // Y should be 1
        D0 = 1; D1 = 0; D2 = 1; D3 = 1; #10; // Y should be 0

        // 3. Select D2 (S = 10)
        S1 = 1; S0 = 0;
        D0 = 0; D1 = 0; D2 = 1; D3 = 0; #10; // Y should be 1
        D0 = 1; D1 = 1; D2 = 0; D3 = 1; #10; // Y should be 0

        // 4. Select D3 (S = 11)
        S1 = 1; S0 = 1;
        D0 = 0; D1 = 0; D2 = 0; D3 = 1; #10; // Y should be 1
        D0 = 1; D1 = 1; D2 = 1; D3 = 0; #10; // Y should be 0
        
        // Final Test - Check all 1s
        S1 = 1; S0 = 1;
        D0 = 1; D1 = 1; D2 = 1; D3 = 1; #10; // Y should be 1 (D3 is selected)

        $finish; // End the simulation
    end
endmodule
