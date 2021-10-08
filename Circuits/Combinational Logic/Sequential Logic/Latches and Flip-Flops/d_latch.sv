module top_module(
    input       d,
    input       ena,
    output      q
    );

    always_latch begin
        if (ena) begin
            q = d;
        end
    end
endmodule
