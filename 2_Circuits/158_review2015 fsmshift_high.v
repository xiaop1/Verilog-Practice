module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter c0=3'd0, c1=3'd1, c2=3'd2, c3=3'd3, c4=3'd4;
    reg [2:0]   state, next_state;
    
    always@(*) begin
        case(state)
            c0:     next_state = reset ? c1 : c0;
            c1:     next_state = c2;
            c2:     next_state = c3;
            c3:     next_state = c4;
            c4:     next_state = c0;
        endcase
    end
    
    always@(posedge clk) begin
       state <= next_state; 
    end
    
    assign shift_ena = (state==c1 || state==c2 || state==c3 || state==c4);
    
endmodule
