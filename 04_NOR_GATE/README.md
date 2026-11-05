
# NOR Gate – Verilog RTL Design and Verification

## 1. Project Overview

This project implements and verifies a 2-input NOR gate using Verilog HDL.

A NOR gate produces a HIGH output only when both inputs are LOW.

## 2. RTL Design

The design is implemented using a Verilog continuous assignment.

```verilog
assign y = ~(a | b);
```

## 3. Truth Table

| A | B | Y |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

## 4. Verification

The testbench includes:

- All four possible input combinations.
- Expected-output checking.
- Error counting.
- Input combination coverage.
- VCD waveform generation.

## 5. Simulation Tools

- Icarus Verilog
- GTKWave
- Visual Studio Code
- Ubuntu Linux

## 6. Run the Simulation

Compile the design and testbench:

```bash
iverilog -g2012 -o nor_test nor_gate.v tb_nor_gate.v
```

Run the simulation:

```bash
vvp nor_test
```

Open the waveform:

```bash
gtkwave nor_gate.vcd
```

## 7. Verification Result

**Status: ALL NOR TESTS PASSED!**

- Total test cases: 4
- Unique input combinations: 4/4
- Input coverage: 100%
- Errors: 0

## 8. Project Files

- `nor_gate.v` – NOR gate RTL design.
- `tb_nor_gate.v` – Verification testbench.
- `nor_gate.vcd` – Simulation waveform.