module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    wire [2:0] tmp;
    assign tmp = {x3,x2,x1};
    always @(*) begin
        case(tmp)
            2,3,5,7: begin
                f = 1;
            end
            0,1,4,6: begin
                f = 0;
            end
        endcase
    end

endmodule
