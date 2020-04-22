module top_module (
    input [3:1] y,
    input w,
    output Y2);

    reg [3:1] Y;
    // A000 B001 C010 D011 E100 F101
    always @(*) begin
        case({y, w})
            4'b0000: Y = 3'b001;
            4'b0001: Y = 3'b000;
            4'b0010: Y = 3'b010;
            4'b0011: Y = 3'b011;
            4'b0100: Y = 3'b100;
            4'b0101: Y = 3'b011;
            4'b0110: Y = 3'b101;
            4'b0111: Y = 3'b000;
            4'b1000: Y = 3'b100;
            4'b1001: Y = 3'b011;
            4'b1010: Y = 3'b010;
            4'b1011: Y = 3'b011;
        endcase
    end
    
    assign Y2 = Y[2];

endmodule
