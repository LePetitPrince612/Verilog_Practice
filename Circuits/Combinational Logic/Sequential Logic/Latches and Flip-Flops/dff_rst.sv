module top_module (
    input                   clk,
    input                   reset,
    input           [7:0]   d,
    output          [7:0]   q
    );

    genvar i;

    generate
        for (i = 0; i < 8; i++) begin: dff
            always_ff @(posedge clk) begin
                if (reset) begin
                    q[i] <= 0;
                end
                else begin
                    q[i] <= d[i];
                end
            end
        end
    endgenerate

endmodule
