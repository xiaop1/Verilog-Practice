module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF ins0(SW[3], KEY[0], KEY[1], KEY[2], KEY[3], LEDR[3]);
    MUXDFF ins1(SW[2], KEY[0], KEY[1], KEY[2], LEDR[3], LEDR[2]);
    MUXDFF ins2(SW[1], KEY[0], KEY[1], KEY[2], LEDR[2], LEDR[1]);
    MUXDFF ins3(SW[0], KEY[0], KEY[1], KEY[2], LEDR[1], LEDR[0]);

endmodule

module MUXDFF (
    input R,
    input clk,
    input E,
    input L,
    input w,
    output out
);
    wire [1:0] mid;
    assign mid[0] = E ? w : out;
    assign mid[1] = L ? R : mid[0];
    
    always @(posedge clk) begin
        out <= mid[1];
    end

endmodule
