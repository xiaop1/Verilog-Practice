module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    always @(posedge clk) begin
        if(reset) begin
            q = 0;
            ena = 0;
        end
        else begin
            q[3:0] = q[3:0] + 1;
            ena[1] = (q[3:0] == 9) ? 1 : 0;
            if(q[3:0] == 10) begin
                q[3:0] = 0;
                q[7:4] = q[7:4] + 1;
            end
            ena[2] = ((q[7:4] == 9) && (q[3:0] == 9)) ? 1 : 0;
            if(q[7:4] == 10) begin
                q[7:4] = 0;
                q[11:8] = q[11:8] + 1;
            end
            ena[3] = ((q[11:8] == 9) && (q[7:4] == 9) && (q[3:0] == 9)) ? 1 : 0;
            if(q[11:8] == 10) begin
                q[11:8] = 0;
                q[15:12] = q[15:12] + 1;
            end
            if(q[15:12] == 10) begin
                q = 0;
            end
        end
    end

endmodule
