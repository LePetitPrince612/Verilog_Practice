module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum);

    wire [4:0]cin;
    assign cin[0] = 0;

    genvar i;
    generate
       for(i = 0; i < 4; i++)begin:add
            full_adder add1(
                .a(x[i]),
                .b(y[i]),
                .cin(cin[i]),
                .cout(cin[i+1]),
                .sum(sum[i])
                );
        end
    endgenerate

    assign sum[4] = cin[4];

endmodule


module full_adder(
    input a, b, cin,
    output cout, sum);
        assign sum = (cin & ~a & ~b) | (~cin & ~a & b) | (cin & a & b) | (~cin & a & ~b);
        assign cout = (cin & b) | (cin & a) | (a & b);

endmodule
