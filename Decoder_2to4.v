`timescale 1ns/1ps

module decoder_2to4(
    input  wire [1:0] code,  
    input  wire       en,    
    output reg  [3:0] out    
);

    always @(*) begin
        if (en) begin
            case (code)
                2'b00: out = 4'b0001;  // activates line 0
                2'b01: out = 4'b0010;  // activates line 1
                2'b10: out = 4'b0100;  // activates line 2
                2'b11: out = 4'b1000;  // activates line 3
                default: out = 4'b0000;
            endcase
        end else begin
            out = 4'b0000; // disabled
        end
    end

endmodule
