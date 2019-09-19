module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] min_mid, min_mid1, min_mid2;
    assign min_mid = (a < b) ? a : b;
    assign min_mid1 = (c < min_mid) ? c : min_mid;
    assign min_mid2 = (d < min_mid1) ? d : min_mid1;
    assign min = min_mid2;

endmodule
