module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    parameter b1 = 1, b2 = 2, b3 = 3, dn = 4;
    reg [2:0] state, next_state;
    reg [23:0] data;

    always @(*) begin
        case ({state, in[3]})
            {b1, 1'b0}: next_state = b1;
            {b1, 1'b1}: next_state = b2;
            {b2, 1'b0}: next_state = b3;
            {b2, 1'b1}: next_state = b3;
            {b3, 1'b0}: next_state = dn;
            {b3, 1'b1}: next_state = dn;
            {dn, 1'b0}: next_state = b1;
            {dn, 1'b1}: next_state = b2;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= b1;
        end
        else begin
            state <= next_state;
        end
    end

    assign done = (state == dn);

    // New: Datapath to store incoming bytes.
    always @(posedge clk) begin
        if (reset) begin
            data <= 24'd0;
        end
        else begin
            data[23:16] <= data[15:8];
            data[15:8] <= data[7:0];
            data[7:0]  <= in;
        end
    end

    assign out_bytes = (done) ? data : 24'd0;

endmodule
