module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT = 0, RIGHT = 1, LEFT_aah = 2, RIGHT_aah = 3;
    reg [2:0] state, next_state;

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= LEFT;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            LEFT: begin
                if (ground) begin
                    next_state <= bump_left ? RIGHT : LEFT;
                end
                else begin
                    next_state <= LEFT_aah;
                end
            end
            RIGHT: begin
                if (ground) begin
                    next_state <= bump_right ? LEFT : RIGHT;
                end
                else begin
                    next_state <= RIGHT_aah;
                end
            end
            LEFT_aah: begin
                if (ground) begin
                    next_state <= LEFT;
                end
                else begin
                    next_state <= LEFT_aah;
                end
            end
            RIGHT_aah: begin
                if (ground) begin
                    next_state <= RIGHT;
                end
                else begin
                    next_state <= RIGHT_aah;
                end
            end
        endcase
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = ((state == LEFT_aah) || (state == RIGHT_aah));

endmodule
