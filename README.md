# RISC-V
A RISC-V processor is a central processing unit (CPU) that implements the RISC-V instruction set architecture (ISA). It is an open-source and royalty-free ISA that provides a standardized set of instructions for designing processors.
## Objective
1. To understand the functioning of a 32 bit RISC-V processor.
2. To implement the logic using Verilog and further, make a FPGA board behave like a 32 bit RISC processor.
3. To analyse the waveform and verify the feasibility of the state machine that we have designed.
## Details about the sub-blocks
Designing a RISC-V processor in Verilog involves designing the following modules in Verilog-
### Register file
A set of general-purpose registers (GPRs) that store operands and results of arithmetic and logical operations.
### Arithmetic Logic Unit (ALU)
Performs arithmetic and logical operations on data.
### Control Unit (CU)
Generates control signals to direct the operations of the processor and coordinates the execution of instructions.
### Pipelining and Data paths
Pipelining is a technique used in computer processors to improve their performance by allowing multiple instructions to be executed concurrently. 
RISC-V processors typically employ a classic 5-stage pipeline:
<ul>
  <li><b>Instruction Fetch (IF):</b>Fetches the instruction from memory and prepares it for decoding.
  <li><b>Instruction Decode (ID):</b>Decodes the fetched instruction to determine the operation to be performed and the operands involved.
  <li><b>Execute (EX):</b>Arithmetic or logical operation based on the decoded instruction and operands is performed.
  <li><b>Memory Access (MEM):</b>Accesses memory to perform load/store operations or to fetch data/instructions.
  <li><b>Write Back (WB):</b>Result of the execution or memory operation is written back to the destination register.
  </ul>
Each stage processes an instruction at a time, and instructions flow through the pipeline sequentially.</br> 
Data paths connect the various pipeline stages and components to facilitate the flow of data and control signals.

![Screenshot (3851)](https://github.com/Jaya-Bansal/RISC-V/assets/100524013/a1e04c02-2576-4435-a580-6fca8b4ed799)

