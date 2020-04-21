module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    reg [3:0] i;
    parameter rc = 0, rd = 1, dn = 2, err = 3;
    reg [2:0] state, next_state;
    reg [7:0] date;

    always @(*) begin
        case (state)
            rd: next_state <= in ? rd : rc;
            rc: begin
                if ((i == 8) & in) begin
                    next_state <= dn;
                end
                else if ((i == 8) & (~in)) begin
                    next_state <= err;
                end
                else begin
                    next_state <= rc;
                    date[i] <= in;
                end
            end
            dn: begin
                next_state <= in ? rd : rc;
                out_byte <= date;
            end
            err: next_state <= in ? rd : err;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= rd;
            i <= 0;
        end
        else begin
            if ((state == rc) && (i != 8)) begin
                i <= i + 1;
            end
            else if ((state == dn)) begin
                i <= 0;
            end
            else if (state == err) begin
                i <= 0;
            end
            state <= next_state;
        end
    end

    // New: Datapath to latch input bits.
    assign done = (state == dn);

endmodule
