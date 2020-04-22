module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    reg [2:0] Y;
    
    always@(*) begin
        case({y, x})
            4'b0000:    Y = 3'b000;
            4'b0001:    Y = 3'b001;
            4'b0010:    Y = 3'b001;
            4'b0011:    Y = 3'b100;
            4'b0100:    Y = 3'b010;
            4'b0101:    Y = 3'b001;
            4'b0110:    Y = 3'b001;
            4'b0111:    Y = 3'b010;
            4'b1000:    Y = 3'b011;
            4'b1001:    Y = 3'b100;
        endcase
    end
    
    assign  z = (y == 3'b011 || y == 3'b100);
    assign Y0 = Y[0];

endmodule
