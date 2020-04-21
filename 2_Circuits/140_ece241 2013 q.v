module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    parameter start = 0, mid = 1, ends = 2;
    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            start: next_state = x ? mid : start;
            mid: next_state = x ? mid : ends;
            ends: next_state = x ? mid : start;
        endcase
    end

    always @(posedge clk or negedge aresetn) begin
        if (!aresetn) begin
            state <= start;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            start: z = 0;
            mid: z = 0;
            ends: z = x;
        endcase
    end

endmodule
