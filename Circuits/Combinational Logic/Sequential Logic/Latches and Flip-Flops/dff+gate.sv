module top_module(
    input           clk,
    input           in,
    output          out
    );

    wire d;
    assign d = (~in & out) | (in & ~out);

    always_ff @(posedge clk) begin
        out <= d;
    end
endmodule    
