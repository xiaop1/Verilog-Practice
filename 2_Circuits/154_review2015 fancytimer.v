module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    parameter idle = 0, s1 = 1, s2 = 2, s3 = 3, b0 = 4, b1 = 5;
    parameter b2 = 6, b3 = 7, counts = 8, waiting = 9;
    reg [3:0] state, next_state;
    reg [9:0] counter;

    always @(*) begin
        case (state)
            idle:   next_state = data ? s1 : idle;
            s1:     next_state = data ? s2 : idle;
            s2:     next_state = data ? s2 : s3;
            s3:     next_state = data ? b0 : idle;
            b0:     next_state = b1;
            b1:     next_state = b2;
            b2:     next_state = b3;
            b3:     next_state = counts;
            counts: next_state = (count == 0 && counter == 999) ? waiting : counts;
            waiting:next_state = ack ? idle : waiting;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            counter <= 0;
        end
        else begin
            case (state)
                b0: count[3] <= data;
                b1: count[2] <= data;
                b2: count[1] <= data;
                b3: count[0] <= data;
                counts: begin
                    if (count >= 0) begin
                        if (counter < 999) begin
                            counter <= counter + 1;
                        end
                        else begin
                            count <= count - 1;
                            counter <= 0;
                        end
                    end
                end
                default: counter <= 0;
            endcase
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= idle;
        end
        else begin
            state <= next_state;
        end
    end

    assign counting = (state == counts);
    assign done = (state == waiting);

endmodule
