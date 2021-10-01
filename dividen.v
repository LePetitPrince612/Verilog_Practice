module top_module
    #(
    parameter N = 2
    )(
    input wire clk,
    input wire rst,
    output wire out
    )
    localparam M = $clog2(N);

    reg [M-1:0]count;
    always@(posedge clk or posedge rst)begin
        if(rst)begin
            count <= 0;
            out <= 0;
        end
        else begin
            count <= count + 1;
            if(count == N - 1)begin
                out <= ~out;
                count <= 0;
            end
        end
    end
endmodule

0101010101010101
0001100110011001

01010101010101010101010101010101
01122334400112233440011223344000
00000000011111111110000000000111
