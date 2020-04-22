module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A = 0, B = 1;
    reg [2:0] state, next_state;
    reg [2:0] w_new;
    reg [2:0] count;

    always @(*) begin
        case ({state, s})
            // there will be a wrong message, if write like {A, 0}
            {A, 1'b0}: next_state = A;
            {A, 1'b1}: next_state = B;
            {B, 1'b0}: next_state = B;
            {B, 1'b1}: next_state = B;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            w_new <= 0;
        end
        else if (next_state == B) begin
            w_new <= {w_new[1:0], w};
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
        end
        else if (next_state == B) begin
            if (count == 3) begin
                count <= 1;
            end
            else begin
                count <= count + 1;
            end
        end
    end

    assign z = (count == 1 && (w_new == 3'b011 || w_new == 3'b110 || w_new == 3'b101));

endmodule
