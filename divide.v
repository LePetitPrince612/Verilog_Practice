module int_div
    #(
    parameter F_DIV = 4
    )(
    input clk,
    output out
    );

    localparam F_DIV_WIDTH = $clog2(F_DIV);

    reg clk_p_r;
    reg clk_n_r;

    reg[F_DIV_WIDTH-1:0] count_p;
    reg[F_DIV_WIDTH-1:0] count_n;

    wire full_p;
    wire half_p;
    wire full_n;
    wire half_n;

    assign full_p = (count_p < F_DIV - 1);
    assign half_p = (count_p < (F_DIV>>1) - 1);
    assign full_n = (count_n < F_DIV - 1);
    assign half_n = (count_n < (F_DIV>>1) - 1);
    assign out = (F_DIV == 1) ? clk : (F_DIV[0] ? (clk_p_r & clk_n_r) : clk_p_r);

    always @(posedge clk) begin
        if(full_p) begin
            count_p <= count_p + 1;
            if(half_p)
                clk_p_r <= 0;
            else
                clk_p_r <= 1;
        end
        else begin
            count_p <= 0;
            clk_p_r <= 0;
        end
    end

    always @(negedge clk) begin
        if(full_n) begin
            count_n <= count_n + 1;
            if(half_n)
                clk_n_r <= 0;
            else
                clk_n_r <= 1;
        end
        else begin
            count_n <= 0;
            clk_n_r <= 0;
        end
    end

    endmodule
