`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 01:40:48 PM
// Design Name: 
// Module Name: Lab9_Sequential
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


module Lab9_Sequential(
input clk,
input rst,
input [3:0] a,
input [3:0] b,
output reg [7:0] p
    );
    
parameter S0_idle = 0 , S1_multiply = 1 , S2_update_result = 2, S3_done= 3 ;
reg [2:0] PS,NS;
reg [7:0] partial_product = 0;
reg [2:0] shift_count = 0;
reg [7:0] multiplicand = 0;
reg [3:0] operand_bb = 0;

 
 
 
 always @(posedge clk or posedge rst) begin
    if (rst == 1)
        PS <= S0_idle;
    else
        PS <= NS;
 end
 
 always @(*) begin
    case (PS)
        S0_idle: begin
            partial_product <= 8'b0;
            shift_count <= 3'b0;
            multiplicand <= {4'b0,a};
            operand_bb <= b;
            NS = S1_multiply;
        end
        S1_multiply: begin
            NS = S2_update_result;
            if ((operand_bb[0] == 0 && shift_count < 4)) begin
                   partial_product <= partial_product;
                   shift_count <= shift_count + 1;
                   multiplicand <= multiplicand << 1;
                   operand_bb <= operand_bb >> 1;
                   end
             else if ((operand_bb[0] == 1 && shift_count < 4))begin
                   partial_product <= partial_product + multiplicand;
                   shift_count <= shift_count +1;
                   multiplicand <= multiplicand << 1;
                   operand_bb <= operand_bb >> 1;
             end
        end
        S2_update_result:begin
            if (shift_count ==4) begin
                NS = S3_done;
                p <= partial_product;
            end
            else begin
                NS = S1_multiply ;
            end
       end
       S3_done: begin
        NS = S0_idle;
        end
       endcase
end              
                
 
endmodule
