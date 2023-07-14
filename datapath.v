`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2023 19:19:27
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input [4:0]rs1,
    input [4:0]rs2,
    input [4:0]rd,
    input [3:0]alu_control,
    input regwrite,
    input clock,
    input reset,
    output zero_flag
);

    wire [31:0]read_data1;
    wire [31:0]read_data2;
    wire [31:0]write_data;
    

    // Instantiating the register file
    Reg_File reg_file_module(
    rs1,
    rs2,
    rd,
    regwrite_control_signal,
    clock,
    reset,
    write_data,
    read_data1,
    read_data2
    );

    // Instanting ALU
    ALU alu_module(read_data1, read_data2, alu_control, write_data, zero_flag);
	 
endmodule

