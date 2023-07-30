`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 19:29:36
// Design Name: 
// Module Name: Reg_File
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


module Reg_File(
  input wire [4:0] rs1, rs2, // input reg
  input wire [4:0] rd, // output reg
  input wire regWrite, // 
  input wire clk,
  input wire reset,
  input wire [31:0] writeData,
  output wire [31:0] readData1,
  output wire [31:0] readData2
);

  reg [31:0] registers [31:0];

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      for(integer i = 0; i<32; i=i+1) registers[i] <= 32'h0+i;
      end
    else if (regWrite)
      registers[rd] <= writeData;
  end

  assign readData1 = (rs1 == 0) ? 32'h0 : registers[rs1];
  assign readData2 = (rs2 == 0) ? 32'h0 : registers[rs2];

endmodule
