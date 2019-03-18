module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    
    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end

endmodule
