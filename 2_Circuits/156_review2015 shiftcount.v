module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    always @(posedge clk) begin
        if (shift_ena) begin
            q <= {q[2:0], data};  // an useful skill
        end
        else if (count_ena) begin
            q <= q - 1;
        end
        else begin
            q <= q;
        end
    end

endmodule
