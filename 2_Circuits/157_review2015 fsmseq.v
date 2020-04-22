module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    parameter a = 0, b = 1, c = 2, d = 3, e = 4;
    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            a: next_state = data ? b : a;
            b: next_state = data ? c : a;
            c: next_state = data ? c : d;
            d: next_state = data ? e : a;
            e: next_state = data ? e : e;
        endcase
    end
    always @(posedge clk) begin
        if (reset) begin
            state <= a;
        end
        else begin
            state <= next_state;
        end
    end

    assign start_shifting = (state == e);

endmodule
