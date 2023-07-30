`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2023 19:33:59
// Design Name: 
// Module Name: Datapath_tb
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


module Datapath_tb();
 reg [4:0] rs1;
    reg [4:0] rs2;
    reg [4:0] rd;
    reg regwrite_control_signal;
    reg [3:0] alu_control_signal; // for alu 
    reg clock;
    reg reset;
    wire zero_flag;

    Datapath DATAPATH_module( 
     rs1,
     rs2,
     rd,
     alu_control_signal,
     regwrite_control_signal,
     clock,
     reset,
     zero_flag
     );

    initial begin
        reset = 1;
        #2 reset = 0;
    end

    initial begin
         rs1 = 0; rs2 = 0; rd = 0; alu_control_signal = 4'b0010;
        #10 rs1 = 2; rs2 = 1; rd = 4; alu_control_signal = 4'b0011;
        #10 rs1 = 7; rs2 = 3; rd = 5; alu_control_signal = 4'b0100;
        #10 rs1 = 1; rs2 = 6; rd = 3; alu_control_signal = 4'b0010;
    end
    initial begin 
    regwrite_control_signal = 0;
   #5 regwrite_control_signal = 1;
    end

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial
        #40 $finish;
    
endmodule
