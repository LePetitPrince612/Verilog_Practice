module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire [15:0] sum1, sum2, sum3;

    add16 inst_add1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .cout(cout),
        .sum(sum1)
        );

    add16 inst_add2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(0),
        .cout(),
        .sum(sum2)
        );

    add16 inst_add3(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1),
        .cout(),
        .sum(sum3)
        );

    always@*begin
        if(cout == 0)begin
            sum <= {sum2, sum1};
        end
        else begin
            sum <= {sum3, sum1};
        end
    end
endmodule
