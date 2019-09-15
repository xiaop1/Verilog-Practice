module top_module (
    input [7:0] code,
    output reg [3:0] out,
    output reg valid = 1 
);//

     always @(*)
        case (code)
            8'h45: begin
                out = 0;
                valid = 1;
            end
            8'h16: begin
                out = 1;
                valid = 1;
            end
            8'h1e: begin
                out = 2;
                valid = 1;
            end
            8'h26: begin
                out = 3;
                valid = 1;
            end
            8'h25: begin
                out = 4;
                valid = 1;
            end
            8'h2e: begin
                out = 5;
                valid = 1;
            end
            8'h36: begin
                out = 6;
                valid = 1;
            end
            8'h3d: begin
                out = 7;
                valid = 1;
            end
            8'h3e: begin
                out = 8;
                valid = 1;
            end
            8'h46: begin
                out = 9;
                valid = 1;
            end
            default: begin
                out = 0;
                valid = 0;
            end
        endcase

endmodule
