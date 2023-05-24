# RISC-V
A RISC-V processor is a central processing unit (CPU) that implements the RISC-V instruction set architecture (ISA). It is an open-source and royalty-free ISA that provides a standardized set of instructions for designing processors.
## Objective
1. To understand the functioning of a 32 bit RISC-V processor.
2. To implement the logic using Verilog and therefore, making a FPGA board behave like a 32 bit RISC processor.
3. To do waveform analysis and verify the feasibility of the state machine that we have designed.
## Details about the sub-blocks
Designing of a RISC-V processor in verilog involves designing of the following modules in Verilog-
### Register file
A set of general-purpose registers (GPRs) that store operands and results of arithmetic and logical operations.
### ALU (Arithmetic Logic Unit)
Performs arithmetic and logical operations on data.
### Memory access
Accesses memory to perform load/store operations or to fetch data/instructions.
### Control units
Generate control signals to direct the operations of the processor and coordinate the execution of instructions.
### Pipelining and Data paths
Pipelining is a technique used in computer processors to improve their performance by allowing multiple instructions to be executed concurrently. 
RISC-V processors typically employ a classic 5-stage pipeline:
<ul>
  <li><b>Instruction Fetch (IF):</b>Fetches the instruction from memory and prepares it for decoding.
  <li><b>Instruction Decode (ID):</b>Decodes the fetched instruction to determine the operation to be performed and the operands involved.
  <li><b>Execute (EX):</b>
  <li><b>Memory Access (MEM):</b>Accesses memory to perform load/store operations or to fetch data/instructions.
  <li><b>Write Back (WB):</b>
  </ul>
Each stage processes an instruction at a time, and instructions flow through the pipeline sequentially. Data paths connect the various pipeline stages and components to facilitate the flow of data and control signals.

