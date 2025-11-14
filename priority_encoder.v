// file: priority_encoder_4to2.v
`timescale 1ns/1ps

module priority_encoder(
    input  wire [3:0] in,    // 4 input lines
    output reg  [1:0] code,  // 2-bit output
    output reg        valid  // output valid flag
);
    always @(*) begin
        valid = 1'b0;
        code  = 2'b00;

        casex (in)
            4'b1xxx: begin code = 2'b11; valid = 1'b1; end // Input 3 has highest priority
            4'b01xx: begin code = 2'b10; valid = 1'b1; end
            4'b001x: begin code = 2'b01; valid = 1'b1; end
            4'b0001: begin code = 2'b00; valid = 1'b1; end
            default: begin code = 2'b00; valid = 1'b0; end // No input active
        endcase
    end
endmodule
