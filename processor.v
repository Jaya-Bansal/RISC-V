`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 18:38:12
// Design Name: 
// Module Name: processor
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
module processor(
input [31:0] instruction_code,
input clock,
input reset,
output zero);
wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;
wire [4:0] rs1, rs2, rd;
wire [3:0] alu_control_signal;
wire regwrite_control_signal;
inst_memory inst(instruction_code, reset, opcode, funct3, funct7, rs1, rs2, rd);
control_unit cu(funct7, funct3, opcode, alu_control_signal, regwrite_control_signal);
Datapath data_path(rs1, rs2, rd, alu_control_signal, regwrite_control_signal, clock, reset, zero);
endmodule
