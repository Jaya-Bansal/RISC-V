`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 16:46:44
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_control_signal, // for alu 
    output reg regwrite_control_signal
);
    always @(funct3 or funct7 or opcode)
    begin
        case (opcode)
        7'b0110011: begin // R-type instructions

            regwrite_control_signal = 1;
            case (funct3)
                0: begin
                    if(funct7 == 0)
                    alu_control_signal = 4'b0010; // ADD
                    else if(funct7 == 32)
                    alu_control_signal = 4'b0100; // SUB
                end
                1: alu_control_signal = 4'b0011; // SLL
                2: alu_control_signal = 4'b0110; // MUL
				        4: alu_control_signal = 4'b0111; // XOR
				        5: alu_control_signal = 4'b0101; // SRL
                6: alu_control_signal = 4'b0001; // OR
                7: alu_control_signal = 4'b0000; // AND
				
            endcase
            end
endcase

    end
    endmodule
