module top_module (
    input [2:0] SW,      // R
    input [1:0] KEY,     // L and clk
    output [2:0] LEDR);  // Q
    
    wire clk, L;
    wire [2:0] R;
    reg [2:0] Q;
    assign clk = KEY[0];
    assign L = KEY[1];
    assign R = SW;

    always @(posedge clk) begin
        Q <= {(L) ? R[2] : (Q[1] ^ Q[2]), (L) ? R[1] : Q[0], (L) ? R[0] : Q[2]};
    end
    
    assign LEDR = Q;

endmodule
