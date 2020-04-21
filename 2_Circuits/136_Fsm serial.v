module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    reg [3:0] i;
    parameter rc = 0, dn = 1, rd = 2, err = 3;
    reg [2:0] state, next_state;

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
                end
            end
            dn: next_state <= in ? rd : rc;
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
            else if (state == err) begin
                i <= 0;
            end
            else if (state == dn) begin
                i <= 0;
            end
            state <= next_state;
        end
    end

    assign done = (state == dn);

endmodule
