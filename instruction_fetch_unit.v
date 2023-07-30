`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2023 18:27:34
// Design Name: 
// Module Name: inst_memory
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


module inst_memory(
input [31:0] instruction_code,
input reset,
output reg [6:0] opcode,
output reg [2:0] funct3,
output reg [6:0] funct7,
output reg [4:0] rs1,
output reg [4:0] rs2,
output reg [4:0] rd);
always @(reset)
begin 
if (instruction_code[6:0]==7'b0110011) // r-type instruction
begin 
funct7 = instruction_code[31:25];  
rs2 = instruction_code[24:20];
rs1 = instruction_code[19:15];
funct3 = instruction_code[14:12];
rd = instruction_code[11:7];
opcode = instruction_code[6:0]; 
end
end
endmodule
