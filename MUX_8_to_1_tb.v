`timescale 1ns / 1ps

module MUX_8_to_1_tb;
reg [7:0] D;  // 8-bit Data Inputs (D[7] is MSB, D[0] is LSB)
    reg [2:0] S;  // 3-bit Select Inputs (S[2] is MSB, S[0] is LSB)
    wire Y;
    MUX_8_to_1 dut (
        .Y(Y),
        .D(D),
        .S(S)
    );
    initial begin
        // Initialize inputs
        D = 8'b00000000;
        S = 3'b000;
        
        // Setup waveform dumping for simulation
        $dumpfile("MUX_8_to_1.vcd");
        $dumpvars(0, MUX_8_to_1_tb);
        
        // Display header (using S decimal value for clarity)
        $display("Time | S (Dec) | D Inputs | Y");
        $display("----------------------------------");
        
        // Monitor current signal values (prints to console on change)
        $monitor("%0t | %0d | %b | %b", 
                 $time, S, D, Y);

        // S = 0 (000): Select D[0]
        S = 3'b000; D = 8'b00000001; #10; // Y should be 1
        
        // S = 1 (001): Select D[1]
        S = 3'b001; D = 8'b00000010; #10; // Y should be 1
        
        // S = 2 (010): Select D[2]
        S = 3'b010; D = 8'b00000100; #10; // Y should be 1
        
        // S = 3 (011): Select D[3]
        S = 3'b011; D = 8'b00001000; #10; // Y should be 1
        
        // S = 4 (100): Select D[4]
        S = 3'b100; D = 8'b00010000; #10; // Y should be 1
        
        // S = 5 (101): Select D[5]
        S = 3'b101; D = 8'b00100000; #10; // Y should be 1
        
        // S = 6 (110): Select D[6]
        S = 3'b110; D = 8'b01000000; #10; // Y should be 1
        
        // S = 7 (111): Select D[7]
        S = 3'b111; D = 8'b10000000; #10; // Y should be 1
        
        // --- Additional Test: Check if Y goes low when selected D input is low ---
        S = 3'b011; D = 8'b00000000; #10; // S=3 (D[3] selected). Since D[3] is 0, Y should be 0.
        
        $finish; // End the simulation
    end
endmodule
