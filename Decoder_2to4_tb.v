`timescale 1ns/1ps

module Decoder_2to4_tb;

    reg  [1:0] code;
    reg        en;
    wire [3:0] out;

    // Instantiate the decoder
    decoder_2to4 uut (
        .code(code),
        .en(en),
        .out(out)
    );

    // Simulation sequence
    integer i;
    initial begin
        $display("Time(ns)\tEn\tCode\tOut");
        $display("------------------------------");
        
        en = 1'b0; code = 2'b00;
        #5 $display("%0dns\t%b\t%b\t%b", $time, en, code, out);
        
        en = 1'b1;
        for (i = 0; i < 4; i = i + 1) begin
            code = i[1:0];
            #5 $display("%0dns\t%b\t%b\t%b", $time, en, code, out);
        end
        
        en = 1'b0; code = 2'b10;
        #5 $display("%0dns\t%b\t%b\t%b", $time, en, code, out);
        
        $display("------------------------------");
        $display("Simulation completed successfully!");
        $finish;
    end

endmodule
