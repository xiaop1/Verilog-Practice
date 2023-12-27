module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output reg [1:0] state
);
    localparam SNT = 0, WNT = 1, WT = 2, ST = 3;
    wire [1:0] next_state;
    
    always@(*)begin
        if (train_valid) begin
            case(state)
                SNT: next_state = train_taken?WNT:SNT;
                WNT: next_state = train_taken?WT:SNT;
                WT: next_state = train_taken?ST:WNT;
                ST: next_state = train_taken?ST:WT;
            endcase
        end else begin
            case(state)
                SNT: next_state = SNT;
                WNT: next_state = WNT;
                WT: next_state = WT;
                ST: next_state = ST;
            endcase
        end
    end

    always@(posedge clk or posedge areset) begin
        if (areset) state <= WNT;
        else state <= next_state;
    end

endmodule
