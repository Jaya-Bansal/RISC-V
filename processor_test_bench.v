`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 18:48:44
// Design Name: 
// Module Name: processor_tb
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

module processor_tb;

  // Inputs
  reg [31:0] instruction_code;
  reg clock;
  reg reset;
  wire zero;
  
  
  // Instantiate the processor module
  processor dut (instruction_code, clock, reset, zero);
  
  initial begin
  reset = 1;
  instruction_code = 32'b00000001010110100000010010110011;
  #50 reset = 0;
  end
  initial begin 
  clock = 0;
  forever #20 clock = ~clock;
  end
  
  initial 
  #80 $finish;
  
endmodule

