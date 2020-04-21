module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter byte1 = 1, byte2 = 2, byte3 = 3, dn = 4;
    reg [3:0] state, next_state;

    // State transition logic (combinational)
    always @(*) begin
        case ({state, in[3]})
            {byte1, 1'b0}: next_state = byte1;
            {byte1, 1'b1}: next_state = byte2;
            {byte2, 1'b0}: next_state = byte3;
            {byte2, 1'b1}: next_state = byte3;
            {byte3, 1'b0}: next_state = dn;
            {byte3, 1'b1}: next_state = dn;
            {dn, 1'b0}: next_state = byte1;
            {dn, 1'b1}: next_state = byte2;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) begin
            state <= byte1;
        end
        else begin
            state <= next_state;
        end
    end

    // Output logic
    assign done = (state == dn);

endmodule
