module RF(A, B, SA, SB, D, DA, W, rst, clk);
    output [3:0]A; // A bus
    output [3:0]B; // B bus
    input SA; // Select A - A Address
    input SB; // Select B - B Address
    input [3:0]D; // Data input
    input DA; // Data destination address
    input W; // write enable
    input rst; // positive logic asynchronous reset
    input clk;
    wire [1:0]load_enable;
    wire [3:0]R00, R01;
    
    Decoder1to2 decoder (load_enable, DA, W);
    RegisterNbit reg00 (D,R00,load_enable[0], rst, clk); //D-in, R00-out
    RegisterNbit reg01 (D,R01,load_enable[1], rst, clk);
    Mux2to1Nbit muxA (A,R00, R01, SA);
    Mux2to1Nbit muxB (B,R00, R01,SB);
endmodule