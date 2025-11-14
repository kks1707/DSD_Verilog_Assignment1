`timescale 1ns/1ps

module SR_latch_tb;

reg S, R;
wire Q, Qbar;

SR_latch dut(S, R, Q, Qbar);

initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(0, SR_latch_tb);

    // Initial condition
    S=0; R=0; #10;   // Hold state

    S=1; R=0; #10;   // Set
    S=0; R=0; #10;   // Hold

    S=0; R=1; #10;   // Reset
    S=0; R=0; #10;   // Hold

    S=1; R=1; #10;   // Invalid state (Q = Qbar = 0)
    S=0; R=0; #10;   // Hold

    $finish;
end
endmodule
