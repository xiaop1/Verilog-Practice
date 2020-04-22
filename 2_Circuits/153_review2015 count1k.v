module top_module (
    input clk,
    input reset,
    output [9:0] q);

    always @(posedge clk) begin
        if (reset) begin
            q <= 0;
        end
        else if (q == 999) begin
            q <= 0;
        end
        else begin
            q <= q + 1;
        end
    end

endmodule
