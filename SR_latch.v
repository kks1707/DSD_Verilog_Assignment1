module SR_latch(
    input S,      // Set
    input R,      // Reset
    output Q,
    output Qbar
);

assign Q    = ~(R | Qbar);   // NOR gate
assign Qbar = ~(S | Q);      // NOR gate

endmodule
