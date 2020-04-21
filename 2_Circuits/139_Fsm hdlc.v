module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    parameter none=4'd0, one=4'd1, two=4'd2, three=4'd3, four=4'd4, five=4'd5, six=4'd6, error=4'd7, discard=4'd8, flagg=4'd9;
    reg [3:0]   state, next_state;
    
    always@(*) begin
        case({state, in})
            {none, 1'b0}:   next_state = none;
            {none, 1'b1}:   next_state = one;
            {one, 1'b0}:    next_state = none;
            {one, 1'b1}:    next_state = two;
            {two, 1'b0}:    next_state = none;
            {two, 1'b1}:    next_state = three;
            {three, 1'b0}:  next_state = none;
            {three, 1'b1}:  next_state = four;
            {four, 1'b0}:   next_state = none;
            {four, 1'b1}:   next_state = five;
            {five, 1'b0}:   next_state = discard;
            {five, 1'b1}:   next_state = six;
            {six, 1'b0}:    next_state = flagg;
            {six, 1'b1}:    next_state = error;
            {error, 1'b0}:  next_state = none;
            {error, 1'b1}:  next_state = error;
            {discard, 1'b0}:next_state = none;
            {discard, 1'b1}:next_state = one;
            {flagg, 1'b0}:  next_state = none;
            {flagg, 1'b1}:  next_state = one;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= none;
        else
            state <= next_state;
    end
    
    assign  disc = (state == discard);
    assign  flag = (state == flagg);
    assign  err = (state == error);
    
endmodule
