`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 03:07:47 PM
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb();

    reg clk,reset;
    reg [2:0]adr1_r,adr2_r,adr_ram;
    wire [7:0]result;
    wire [3:0] st_out;
    
    
    Multiplier_top multymultyhellyeah(.clk(clk),.reset(reset),.adr1_r(adr1_r),.adr2_r(adr2_r),.adr_ram(adr_ram),.result(result),.st_out(st_out));
    
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial 
    begin
        reset = 1;
        #10
        reset = 0;
        adr1_r = 1;
        adr2_r = 3;
        adr_ram = 1;
        #60;
        reset = 1;
        #10
        reset = 0;
        adr1_r = 2;
        adr2_r = 4;
        adr_ram = 2;
        #60;
        reset = 1;
        #10
        reset = 0;
        adr1_r = 3;
        adr2_r = 1;
        adr_ram = 3;
        #60;
    end
endmodule
