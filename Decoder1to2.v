module Decoder1to2(m, S, en);
    input S; // select
    input en; // enable (positive logic)
    output [1:0]m; // 32 minterms
    assign m[0] = ~S&en;
    assign m[1] = S&en;
endmodule