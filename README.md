# Design-and-synthesize-a-32-bit-processor
#### Project Overview
This project involves the design and implementation of a 32-bit RISC-like processor using Verilog. The processor features sixteen 32-bit general-purpose registers, a program counter, a stack pointer, and supports a variety of arithmetic, logic, load/store, branch, stack, and control instructions. The design has been tested and verified using an FPGA.

#### Features
- **Sixteen 32-bit General-Purpose Registers**: Organized as a register bank with two read ports and one write port.
- **Comprehensive Instruction Set**: Includes arithmetic, logic, load/store, branch, stack, and control instructions with immediate and register addressing modes.
- **ALU Integration**: Structured Arithmetic Logic Unit (ALU) integrated with register bank and memory.
- **FPGA Testing**: Extensive testing and verification using FPGA.

#### Instructions for GCD Simulation
1. **Modify `Branch_logic.v`**:
   - Uncomment lines 62 to 67.
   - Comment lines 71 to 76.

2. **Modify `INSTRUCTION_Memory`**:
   - Uncomment lines 57 to 71.
   - Comment lines 80 to 156.

3. **Run Testbench**:
   - Execute the testbench to simulate the GCD operation.

#### Instructions for Sorting Simulation
- No modifications are required for sorting simulation.
- Simply run the testbench to simulate the sorting operation.

#### Directory Structure
- `Submission_4/`: Contains the source files and testbenches for the project.
- `readme.txt`: This file.
