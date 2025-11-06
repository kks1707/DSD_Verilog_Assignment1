

`timescale 1ns/1ps

module priority_encoder_tb;

    reg  [3:0] in;       // Input to encoder
    wire [1:0] code;     // Encoded output
    wire       valid;    // Valid output flag

 
    priority_encoder_4to2 uut (
        .in(in),
        .code(code),
        .valid(valid)
    );

    
    integer i;
    initial begin
        $display("Time(ns)\tInput\tValid\tCode");
        $display("---------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            in = i[3:0];    
            #5;             
            $display("%0dns\t%b\t%b\t%b", $time, in, valid, code);
        end

        $display("---------------------------------");
        $display("Simulation completed successfully!");
        $finish;
    end

endmodule
