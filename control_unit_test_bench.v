`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 17:17:47
// Design Name: 
// Module Name: CU_tb
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


module CU_tb;
    reg [6:0] funct7;
    reg [2:0] funct3;
    reg [6:0] opcode;
    wire [3:0] alu_control_signal;
    wire regwrite_control_signal;
    control_unit dut1(
        .funct7(funct7),
        .funct3(funct3),
        .opcode(opcode),
        .alu_control_signal(alu_control_signal),
        .regwrite_control_signal(regwrite_control_signal)
    );

    initial begin
        // Test case 1: opcode = 0110011, funct3 = 000, funct7 = 0000000
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #10;
        // Test case 2: opcode = 0110011, funct3 = 001, funct7 = 1000000
        opcode = 7'b0110011;
        funct3 = 3'b001;
        funct7 = 7'b1000000;
        #10; 
        // Test case 3: opcode = 0110011, funct3 = 010, funct7 = 0000000
        opcode = 7'b0110011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;  
        // Test case 4: opcode = 0110011, funct3 = 100, funct7 = 0000000
        opcode = 7'b0110011;
        funct3 = 3'b100;
        funct7 = 7'b0000000;
        #10;  
        // Test case 5: opcode = 0110011, funct3 = 101, funct7 = 0000000
        opcode = 7'b0110011;
        funct3 = 3'b101;
        funct7 = 7'b0000000;
        #10;
        // Test case 6: opcode = 0110011, funct3 = 110, funct7 = 0000000
        opcode = 7'b0110011;
        funct3 = 3'b110;
        funct7 = 7'b0000000;
        #10;  
        // Test case 7: opcode = 0110011, funct3 = 111, funct7 = 0000000
        opcode = 7'b0110011;
        funct3 = 3'b111;
        funct7 = 7'b0000000;
        #10;  
        
        #100 $finish;        
    end
endmodule

