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

    // M-HHH 提供的精简思路
    // assign cout[0] = a[0] & b[0] | a[0] & cin | b[0] & cin;
    // assign sum[0]  = a[0] ^ b[0] ^ cin;
    
    // integer i, j;
    
    // always @ (*)
    //     begin
    //         for (i=1; i<100; i++)    
    //             begin
    //                 sum[i]  = a[i] ^ b[i] ^ cout[i-1];
    //             end
    //     end
    
    // always @ (*)
    //     begin
    //         for(i=1; i<100; i++)
    //             begin
    //                 cout[i] = a[i] & b[i] | a[i] & cout[i-1] | b[i] & cout[i-1];  
    //             end
    //     end

    //基于 M-HHH 的思路作出的二次优化
    // assign cout[0] = a[0] & b[0] | a[0] & cin | b[0] & cin;
    // assign sum[0]  = a[0] ^ b[0] ^ cin;
    
    // integer i;
    
    // always @ (*) begin
    //     for (i=1; i<100; i++) begin
    //             cout[i] = a[i] & b[i] | a[i] & cout[i-1] | b[i] & cout[i-1];
    //             sum[i]  = a[i] ^ b[i] ^ cout[i-1];
    //     end
    // end


endmodule
