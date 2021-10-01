module top_module(
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [100:0]temp_cin;
    assign temp_cin[0] = cin;

    genvar i;
    generate
       for(i = 0; i < 100; i++)begin:add
            full_adder add1(
                .a(a[i]),
                .b(b[i]),
                .cin(temp_cin[i]),
                .cout(temp_cin[i+1]),
                .sum(sum[i])
                );
        end
    endgenerate

    assign cout = temp_cin[100];

endmodule


module full_adder(
    input a, b, cin,
    output cout, sum);
        assign sum = (cin & ~a & ~b) | (~cin & ~a & b) | (cin & a & b) | (~cin & a & ~b);
        assign cout = (cin & b) | (cin & a) | (a & b);

endmodule
