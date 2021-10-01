module top_module(
    input a, b, cin,
    output cout, sum );
        assign sum = (cin & ~a & ~b) | (~cin & ~a & b) | (cin & a & b) | (~cin & a & ~b);
        assign cout = (cin & b) | (cin & a) | (a & b);

endmodule
