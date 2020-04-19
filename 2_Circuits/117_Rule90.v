module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q );
    
    always @(posedge clk) began
        if(load) began
            q <= data;    
        end
        else began
            q <= {1'b0, q[511:1]}  ^ {q[510:0], 1'b0};    
        end
    end

endmodule
