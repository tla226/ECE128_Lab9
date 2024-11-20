`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 03:13:47 PM
// Design Name: 
// Module Name: Lab9_Q2_Combinational_tb
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


module Lab9_Q2_Combinational_tb;
reg clk;
reg [3:0] a;
reg [3:0] b;
wire [7:0] p;

Lab9_Q2_Combinational uut1(clk, a, b, p);

initial begin
    clk = 1'b0;
    a = 4'b0110;
    b = 4'b0011;
#10;
    a = 4'b1010;
    b = 4'b0010;
#10;
    a = 4'b0100;
    b = 4'b1001;
#10;
$stop;
end

always #10 clk = ~clk;
endmodule
