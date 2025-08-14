# Medium-Complexity Sequential Circuits

This folder contains Verilog implementations of medium-level sequential logic circuits, each with its own testbench for simulation.

## Contents

1. **Barrel Shifter**
   - Supports left/right shift and rotate operations.
   - Parameterized for different bit-widths.
   
2. **Priority Encoder**
   - Outputs the highest priority active input bit.
   - Includes "valid" output signal.

3. **Universal Shift Register**
   - Supports parallel load, serial in/out, and bidirectional shifting.

4. **Synchronous Counter with Preset**
   - Count up with synchronous load and clear functionality.
   

## Simulation
All modules include a `*_tb.v` testbench.
Run simulations in ModelSim, Vivado, or any Verilog simulator.

