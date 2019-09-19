module top_module 
    (
        input clk,
        input reset,
        input ena,
        output pm,
        output [7:0] hh,
        output [7:0] mm,
        output [7:0] ss
    );

    reg p;  //0: am, 1: pm
    reg [7:0] h;
    reg [7:0] m;
    reg [7:0] s;

    always @ (posedge clk)
        begin
            if(reset)
                begin
                    p <= 0;
                    h <= 8'h12;
                    m <= 8'h00;
                    s <= 8'h00;
                end
            else
                begin
                    if(ena)
                        begin
                            if(s < 8'h59)
                                begin
                                    if(s[3:0] < 4'h9)
                                        begin
                                            s[3:0] <= s[3:0] + 1'h1; 
                                        end
                                    else
                                        begin
                                            s[3:0] <= 0;
                                            s[7:4] <= s[7:4] + 1'h1;
                                        end 
                                end
                            else
                                begin
                                    s <= 0;
                                    if(m < 8'h59)
                                        begin
                                            if(m[3:0] < 4'h9)
                                                begin
                                                    m[3:0] <= m[3:0] + 1'h1; 
                                                end 
                                            else
                                                begin
                                                    m[3:0] <= 0;
                                                    m[7:4] <= m[7:4] + 1'h1;
                                                end
                                        end
                                    else
                                        begin
                                            m <= 1'h0;
                                            if(h == 8'h11)
                                                p = !p;
                                            if(h < 8'h12)
                                                begin
                                                    if(h[3:0] < 4'h9)
                                                        h[3:0] <= h[3:0] + 1'h1;
                                                    else
                                                        begin
                                                            h[3:0] <= 4'h0;
                                                            h[7:4] <= h[7:4] + 1'h1;
                                                        end
                                                end
                                            else
                                                begin
                                                   h <= 1'h1; 
                                                end
                                        end
                                end
                        end
                end
        end

    assign pm = p;
    assign hh = h;
    assign mm = m;
    assign ss = s;

endmodule