module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output reg f,
    output reg g
); 

    parameter A=4'd0, f1=4'd1, tmp0=4'd2, tmp1=4'd3, tmp2=4'd4, g1=4'd5, g1p=4'd6, tmp3=4'd7, g0p=4'd8;
    reg [3:0] state, next_state;
    
    always@(*) begin
        case(state)
            A: begin
                if(resetn) 
                    next_state = f1;
                else
                    next_state = A;
            end
            f1:     next_state = tmp0;
            tmp0: begin
                if(x)
                    next_state = tmp1;
                else
                    next_state = tmp0;
            end
            tmp1: begin
                if(~x)
                    next_state = tmp2;
                else
                    next_state = tmp1;
            end
            tmp2: begin
                if(x)
                    next_state = g1;
                else
                    next_state = tmp0;
            end
            g1: begin
                if(y)
                    next_state = g1p;
                else
                    next_state = tmp3;
            end
            tmp3: begin
                if(y)
                    next_state = g1p;
                else
                    next_state = g0p;
            end
            g1p: begin
                if(~resetn)
                    next_state = A;
                else
                    next_state = g1p;
            end
            g0p: begin
                if(~resetn)
                    next_state = A;
                else
                    next_state = g0p;
            end
        endcase
    end
    
    always@(posedge clk) begin
        if(~resetn)
            state <= A;
        else
            state <= next_state;
    end
    
    always@(posedge clk) begin
        case(next_state)
            f1:     f <= 1'b1;
            g1,
            tmp3,
            g1p:    g <= 1'b1;
            g0p:    g <= 1'b0;
            default: begin
                    f <= 1'b0;
                    g <= 1'b0;
            end
        endcase
    end

endmodule
