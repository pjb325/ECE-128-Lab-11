`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 02:28:41 PM
// Design Name: 
// Module Name: Multiplier_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Multiplier_top(clk,reset,adr1_r,adr2_r,adr_ram,result,st_out);
    //I/O declaration
    input clk;
    input reset;
    input [2:0]adr1_r;
    input [2:0]adr2_r;
    input [2:0]adr_ram;
    output [7:0] result;
    output [3:0] st_out;
    
    //Portmap
    wire [3:0] ROM_data;
    wire [2:0] ROM_addr;
    wire W;
    wire DA;
    wire SA1;
    wire SA2;
    wire [3:0] Data1;
    wire [3:0] Data2;
    wire [7:0] Product;
    wire W_r;
    
    //module cu (input clk, reset,input [2:0] adr1, input [2:0] adr2, output reg w_rf,output reg [2:0] adr,output reg DA,SA,SB, output reg [3:0] st_out, output reg w_ram);
    //module Four_bit_ROM(ROM_data, ROM_addr);
    //module RF(A, B, SA, SB, D, DA, W, rst, clk);
    

    Four_bit_ROM uut1 (.ROM_data(ROM_data), .ROM_addr(ROM_addr));
    cu uut4(.clk(clk), .reset(reset), .adr1(adr1_r), .adr2(adr2_r), .w_rf(W), .adr(ROM_addr), .DA(DA), .SA(SA1), .SB(SA2), .st_out(st_out), .w_ram(W_r));
    RF uut5(.A(Data1), .B(Data2), .SA(SA1), .SB(SA2), .D(ROM_data), .DA(DA), .W(W), .rst(reset), .clk(clk));
    multiplier uut2(.a(Data1), .b(Data2), .p(Product)); //Use combinational -1 from the slide
    Eight_bit_Ram uut3(.i_clk(clk), .i_rst(reset), .i_write_en(W_r), .i_addr(adr_ram), .i_write_data(Product), .o_read_data(result));
endmodule