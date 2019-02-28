module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    always @(*) begin
        for(int i = 0; i < 100; i++) begin
            if(!i) begin  // 加法刚开始，所以进位标志用cin
                if(!cin) begin // 第一种情况，无进位
                    if(a[i] == 0 && b[i] == 0) begin
                        sum[i] = 0;
                        cout[i] = 0;
                    end
                    else if((a[i] == 0 && b[i] == 1) || (a[i] == 1 && b[i] == 0)) begin
                        sum[i] = 1;
                        cout[i] = 0;
                    end
                    else begin
                        sum[i] = 0;
                        cout[i] = 1;
                    end
                end
                else begin // 第二种情况，进位
                    if(a[i] == 0 && b[i] == 0) begin
                        sum[i] = 1;
                        cout[i] = 0;
                    end
                    else if((a[i] == 0 && b[i] == 1) || (a[i] == 1 && b[i] == 0)) begin
                        sum[i] = 0;
                        cout[i] = 1;
                    end
                    else begin
                        sum[i] = 1;
                        cout[i] = 1;
                    end
                end
            end
            else begin // 加法已经开始，所以进位标志用cout[i - 1]
                if(!cout[i - 1]) begin // 第一种情况，无进位
                    if(a[i] == 0 && b[i] == 0) begin
                        sum[i] = 0;
                        cout[i] = 0;
                    end
                    else if((a[i] == 0 && b[i] == 1) || (a[i] == 1 && b[i] == 0)) begin
                        sum[i] = 1;
                        cout[i] = 0;
                    end
                    else begin
                        sum[i] = 0;
                        cout[i] = 1;
                    end
                end
                else begin // 第二种情况，进位
                    if(a[i] == 0 && b[i] == 0) begin
                        sum[i] = 1;
                        cout[i] = 0;
                    end
                    else if((a[i] == 0 && b[i] == 1) || (a[i] == 1 && b[i] == 0)) begin
                        sum[i] = 0;
                        cout[i] = 1;
                    end
                    else begin
                        sum[i] = 1;
                        cout[i] = 1;
                    end
                end
            end
        end
    end

endmodule
