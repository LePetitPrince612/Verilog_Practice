module top_module(
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [4:0]temp;
    assign temp[0] = cin;

    genvar i;
    generate
        for(i = 0; i < 4; i++)begin:bcd
            bcd_fadd inst_bcd(
                .a(a[4*i+3 -: 4]),
                .b(b[4*i+3 -: 4]),
                .cin(temp[i]),
                .cout(temp[i+1]),
                .sum(sum[4*i+3 -: 4])
                );
        end
    endgenerate

    assign cout = temp[4];

endmodule
