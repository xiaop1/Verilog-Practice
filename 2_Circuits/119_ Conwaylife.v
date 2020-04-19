module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [3:0] sum;

    always @(posedge clk) begin
        if (load) begin
            q  <= data;
        end
        else begin
            for (integer i = 0; i < 256; i++) begin
                if (i == 0) begin
                    sum = q[1]+q[16]+q[17]+q[240]+q[241]+q[15]+q[31]+q[255];
                end
                else if (i == 15) begin
                    sum = q[14]+q[16]+q[0]+q[240]+q[254]+q[30]+q[31]+q[255];
                end
                else if (i == 240) begin
                    sum = q[0]+q[15]+q[239]+q[241]+q[1]+q[224]+q[225]+q[255];
                end
                else if (i == 255) begin
                    sum = q[0]+q[15]+q[14]+q[224]+q[238]+q[240]+q[239]+q[254];
                end
                else if (i > 0 && i < 15) begin
                    sum = q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i+17]+q[i+239]+q[i+240]+q[i+241];
                end
                else if (i % 16 == 0) begin
                    sum = q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i+17]+q[i-16]+q[i-15]+q[i+31];
                end
                else if (i % 16 == 15) begin
                    sum = q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i-17]+q[i-16]+q[i-15]+q[i-31];
                end
                else if (i > 240 && i < 255) begin
                    sum = q[i-1]+q[i+1]+q[i-17]+q[i-16]+q[i-15]+q[i-239]+q[i-240]+q[i-241];
                end
                else begin
                    sum = q[i-1]+q[i+1]+q[i-17]+q[i-16]+q[i-15]+q[i+15]+q[i+16]+q[i+17];
                end

                if ((sum == 0 || sum == 1) || (sum >= 4)) begin
                    q[i] <= 0;
                end
                else if (sum == 3) begin
                    q[i] <= 1;
                end
            end
        end
    end

endmodule