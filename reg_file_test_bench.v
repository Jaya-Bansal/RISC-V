`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 19:36:34
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb();

  reg [4:0] rs1, rs2, rd;
  reg regWrite, clk, reset;
  reg [31:0] writeData;
  wire [31:0] readData1, readData2;

  Reg_File dut (
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .regWrite(regWrite),
    .clk(clk),
    .reset(reset),
    .writeData(writeData),
    .readData1(readData1),
    .readData2(readData2)
  );

  initial begin
    // Initialize inputs
    rs1 = 5;   // Register index for rs1
    rs2 = 10;  // Register index for rs2
    rd = 15;   // Register index for rd
    regWrite = 1;   // Enable register write
    clk = 0;   // Initialize clock
    reset = 1; // Assert reset
    writeData = 32'h12345678; // Data to be written

    // Apply reset
    #10 reset = 0;

    // Write operation
    #10 regWrite = 1;
    #10 writeData = 32'habcdef12;
    #10 rd = 20;
    #10 regWrite = 0;

    // Read operations
    #10 rs1 = 5;
    #10 rs2 = 20;

    // Toggle clock and observe outputs
    #10 clk = 1;
    #10 clk = 0;
    #10 clk = 1;
    #10 clk = 0;

    // Add delay for observing the final output
    #10 $finish;
  end

  always #5 clk = ~clk; // Toggle clock every 5 time units

endmodule
