module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter idle=4'd0, s1=4'd1, s11=4'd2, s110=4'd3, b0=4'd4, b1=4'd5, b2=4'd6, b3=4'd7, count=4'd8, waiting=4'd9;
    reg [3:0]   state, next_state;
    
    always@(*) begin
        case(state)
            idle: begin
                if(data==1'b0)
                    next_state = idle;
                else
                    next_state = s1;
            end
            s1: begin
                if(data==1'b0)
                    next_state = idle;
                else
                    next_state = s11;
            end
            s11: begin
                if(data==1'b0)
                    next_state = s110;
                else
                    next_state = s11;
            end
            s110: begin
                if(data==1'b0)
                    next_state = idle;
                else
                    next_state = b0;
            end
            b0:     next_state = b1;
            b1:     next_state = b2;
            b2:     next_state = b3;
            b3:     next_state = count;
            count: begin
                if(done_counting)
                    next_state = waiting;
                else
                    next_state = count;
            end
            waiting: begin
                if(ack)
                    next_state = idle;
                else
                    next_state = waiting;
            end
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next_state;
    end
    
    assign  shift_ena = (state==b0 || state==b1|| state==b2 || state==b3);
    assign  counting = (state==count);
    assign  done = (state==waiting);
    
endmodule
