`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 02:50:35 PM
// Design Name: 
// Module Name: Lab9_Sequential_tb
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


module Lab9_Sequential_tb;
reg clk;
reg rst;
reg [3:0] a;
reg [3:0] b;
wire [7:0] p;

Lab9_Sequential uut1(clk, rst, a, b, p);

initial begin
    clk = 1'b0;
    rst = 1'b1;
    #20 rst = 1'b0;
    a = 4'b0110; //12
    b = 4'b0010;
    #40;
    rst = 1'b1;
    #40 rst = 1'b0;
    a = 4'b1111;
    b = 4'b1111; //2
    #40;
    rst = 1'b1;
    #40 rst = 1'b0;
    a = 4'b0101; //10
    b = 4'b0010;
#40;
end

always #10 clk = ~clk;

endmodule
