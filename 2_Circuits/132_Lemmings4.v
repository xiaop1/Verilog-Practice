module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter left=3'd0, right=3'd1, falll=3'd2, fallr=3'd3, digl=3'd4, digr=3'd5, splat=3'd6;
    reg [2:0] state, next_state;
    reg [31:0] count;

    always@(posedge clk or posedge areset) begin
        if(areset)
            state <= left;
        else if(state == falll || state == fallr) begin
            state <= next_state;
            count <= count + 1;
        end
        else begin
            state <= next_state;
            count <= 0;
        end
    end

    always@(*) begin
        case(state)
            left: begin
                if(~ground)         next_state = falll;
                else if(dig)        next_state = digl;
                else if(bump_left)  next_state = right;
                else                next_state = left;
            end
            right: begin
                if(~ground)         next_state = fallr;
                else if(dig)        next_state = digr;
                else if(bump_right) next_state = left;
                else                next_state = right;
            end
            falll: begin
                if(ground) begin
                    if(count>19)    next_state = splat;
                    else            next_state = left;
                end
                else                next_state = falll;
            end
            fallr: begin
                if(ground) begin
                    if(count>19)    next_state = splat;
                    else            next_state = right;
                end
                else                next_state = fallr;
            end
            digl: begin
                if(ground)  next_state = digl;
                else        next_state = falll;
            end
            digr: begin
                if(ground)  next_state = digr;
                else        next_state = fallr;
            end
            splat: begin
                next_state = splat;
            end
        endcase
    end

    assign  walk_left = (state == left);
    assign  walk_right = (state == right);
    assign  aaah = (state == falll || state == fallr);
    assign  digging = (state == digl || state == digr);

endmodule
