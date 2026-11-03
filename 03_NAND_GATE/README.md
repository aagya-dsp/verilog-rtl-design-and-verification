NAND Gate - Verilog RTL Design and Verification


Objective:
Design and verify a 2-input NAND gate using Verilog HDL.

RTL Design:
The NAND gate implements:
Y = ~(A & B)

Truth Table:
A       B       Y
0       0       1
0       1       1
1       0       1
1       1       0

Verification Methodology:
- Developed a self-checking testbench.
- Applied all four possible input combinations using a loop.
- Created an independent reference model using a case statement.
- Compared actual and expected outputs using case inequality (!==).
- Counted verification errors automatically.
- Implemented unique input combination coverage using a 4-bit coverage register.
- Generated waveform data for GTKWave inspection.
- Performed fault injection by temporarily replacing the NAND RTL with an AND operation to verify that the testbench detects incorrect behavior.

Simulation Tools:
- Icarus Verilog
- GTKWave
- VS Code
- Ubuntu Linux

Simulation Commands:
iverilog -g2012 -o nand_test nand_gate.v tb_nand_gate.v
vvp nand_test
gtkwave nand_gate.vcd

Expected Results:
- All four input combinations tested.
- Input coverage: 100%.
- All NAND test cases pass.
- Incorrect RTL behavior is detected by the testbench.

Learning Outcomes:
- Verilog combinational logic design.
- Testbench development.
- Reference model implementation.
- Automatic output checking.
- Unique input coverage tracking.
- Waveform analysis and debugging.
- Basic fault injection and verification.