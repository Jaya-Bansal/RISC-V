`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 13:04:00
// Design Name: 
// Module Name: inst_memory_tb
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

module inst_memory_tb();
reg [31:0] instruction_code;
reg reset;
wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
inst_memory DUT(.instruction_code(instruction_code), .reset(reset), .opcode(opcode), 
.funct3(funct3), .funct7(funct7), .rs1(rs1), .rs2(rs2), .rd(rd));
initial begin 
reset = 1;
instruction_code = 32'b00000001010110100000010010110011;
 #10 $finish;  
end

endmodule
