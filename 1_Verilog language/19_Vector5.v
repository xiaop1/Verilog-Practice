module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    assign out[24:20] = ~ {5{a}} ^ {a, b, c, d, e};
    assign out[19:15] = ~ {5{b}} ^ {a, b, c, d, e};
    assign out[14:10] = ~ {5{c}} ^ {a, b, c, d, e};
    assign out[9:5] = ~ {5{d}} ^ {a, b, c, d, e};
    assign out[4:0] = ~ {5{e}} ^ {a, b, c, d, e};

endmodule
