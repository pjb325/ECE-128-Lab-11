module Mux2to1Nbit(o, i1,i2, s);
    input [3:0] i1,i2;
    input s;
    output reg [3:0] o;
    always @(s or i1 or i2)
    begin
        case (s)
        1'b0 : o = i1;
        1'b1 : o = i2;
        default : o = 4'b0;
    endcase
    end
endmodule