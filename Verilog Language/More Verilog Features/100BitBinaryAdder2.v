module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    wire [100:0] cout_i;
    assign cout_i[0] = cin;

    genvar i;
    generate
        for(i = 0; i < 100; i++)begin: add
            assign cout_i[i+1] = (a[i] & cout_i[i]) | (b[i] & cout_i[i]) | (a[i] & b[i]);
            assign sum[i] = (~a[i] & ~b[i] & cout_i[i]) | (~a[i] & b[i] & ~cout_i[i]) | (a[i] & b[i] & cout_i[i]) | (a[i] & ~b[i] & ~cout_i[i]);
        end
    endgenerate

    assign cout = cout_i[100:1];

endmodule
