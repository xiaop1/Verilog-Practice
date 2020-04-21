module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    localparam S0 = 0, S1 = 1;
    reg [1:0] state;
    reg [1:0] next_state;
    
    always @(*) begin
        next_state = 2'b0;
        case(1'b1)
            state[S0] : begin
                next_state[S1] = x ? 1'b1 : 1'b0;
                next_state[S0] = x ? 1'b0 : 1'b1;
                z = x;
            end
            
            state[S1] : begin
                next_state[S1] = 1'b1;
                next_state[S0] = 1'b0;
                z = ~x;
            end
            
            default : begin
                next_state[S0] = 1'b1;
                next_state[S1] = 1'b0;
                z = 1'b0;
            end
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset)  begin
            state <= 2'b0;
            state[S0] <= 1'b1;
        end
        else
            state <= next_state;
    end
   
endmodule
