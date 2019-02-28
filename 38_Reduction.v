module top_module (
    input [7:0] in,
    output parity); 
    assign parity = ^ in[7:0];
endmodule
