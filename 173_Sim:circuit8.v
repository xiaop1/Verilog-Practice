module top_module (
    input clock,
    input a,
    output p,
    output q );
    
    always @ (*) begin
        if(clock == 1) begin
            p = a;
        end
        else begin
            q = p;
        end
    end

endmodule
