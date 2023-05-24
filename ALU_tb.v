`timescale 1ns / 1ps
module ALU_tb();
    reg [31:0] in1,in2;
    reg [3:0] ALUControl_SIGNAL;
    wire ZERO;
    wire [31:0] ALUResult;
    ALU ALU_module(.in1(in1),.in2(in2),.alu_control_signal(ALUControl_SIGNAL),.zero_flag(ZERO),.alu_result(ALUResult));
    initial
    begin
        in1 = 4; in2 = 12;  ALUControl_SIGNAL = 4'b0000;
    #20 in1 = 4; in2 = 12;  ALUControl_SIGNAL  = 4'b0001;
    #20 in1 = 4; in2 = 12;  ALUControl_SIGNAL  = 4'b0010;
    #20 in1 = 4; in2 = 12;  ALUControl_SIGNAL  = 4'b0100;
    #20 in1 = 4; in2 = 12;  ALUControl_SIGNAL  = 4'b1000;
    #20 in1 = 4; in2 = 12;  ALUControl_SIGNAL  = 4'b1000;
    #20 in1 = 4; in2 = 12;  ALUControl_SIGNAL  = 4'b0100;
    end
    initial
    #150 $finish;
endmodule
