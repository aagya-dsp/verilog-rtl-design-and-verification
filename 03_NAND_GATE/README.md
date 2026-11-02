NAND Gate — Verilog RTL Design and Verification
1. Objective
Design and verify a 2-input NAND gate using Verilog HDL.

2. Tools Used
- Ubuntu Linux
- Visual Studio Code
- Icarus Verilog
- GTKWave

3. Design Description
A NAND gate produces output LOW (0) only when both inputs are HIGH (1).
Boolean expression:
Y = ~(A & B)

4. Truth Table
A   B   Y
0   0   1
0   1   1
1   0   1
1   1   0

5. Verification
- Created a Verilog testbench.
- Used a for loop to test all four input combinations.
- Implemented automatic output checking.
- All four test cases passed.
- Observed waveforms using GTKWave.

6. Learning Outcomes
- NAND gate RTL design
- Verilog concatenation assignment
- for-loop-based stimulus generation
- Self-checking testbench development
- Simulation and waveform analysis