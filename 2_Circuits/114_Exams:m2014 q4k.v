module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [2:0] Q;
    
    always @(posedge clk) begin
        Q[0] <= (resetn) ? in : 0;
        Q[1] <= (resetn) ? Q[0] : 0;
        Q[2] <= (resetn) ? Q[1] : 0;
        out <= (resetn) ? Q[2] : 0;
    end

endmodule
