module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter S0 = 0, S1 = 1, S2 = 2;
    reg [1:0] state;
    reg [1:0] next_state;
    
    always @(*) begin
        case(state)
            S0 : begin
                next_state = x ? S1 : S0;
                z = 1'b0;
            end
            
            S1 : begin
                next_state = x ? S2 : S1;
                z = 1'b1;
            end
            
            S2 : begin
                next_state = x ? S2 : S1;
                z = 1'b0;
            end
            default : begin
                next_state = S0;
                z = 1'b0;
            end
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset)  
            state <= S0;
        else
            state <= next_state;
    end
    

endmodule
