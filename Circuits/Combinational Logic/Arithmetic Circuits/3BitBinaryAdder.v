module top_module(
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    wire [3:0]temp_cout;
    assign temp_cout[0] = cin;

    wire [1:0]add_buff;

    always@*begin
        for(int i = 0; i < 3; i++)begin
            add_buff = a[i] + b[i] + temp_cout[i];
            sum[i] = add_buff[0];
            temp_cout[i+1] = add_buff[1];
        end
    end

    assign cout = temp_cout[3:1];

endmodule
