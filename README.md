# 32x32_Register_2R1W
A 32x32 Register using System Verilog.  This can be used in RISC-V Processors.

# Description
The top_Register_2R1W module is a two read one write register file implementation in Verilog HDL. It is a combinational logic circuit that consists of input ports, output ports, and an internal register file. The input ports include Data_IN, RW, R1, R2, RD, WR, Reset, EN, and Clock. The output ports include Q1 and Q2.

Data_IN is the input data to be written into the register file.
RW is the write address for the register file.
R1 and R2 are the two read addresses for the register file.
RD and WR are the control signals for read and write operations, respectively.
Reset is the reset signal for the register file.
EN is the enable signal for the register file.
Clock is the clock signal for the register file.
Q1 and Q2 are the output data from the register file at read addresses R1 and R2, respectively.

The parameter M defines the number of registers in the register file, and the parameter N defines the width of each register in bits.

The module includes an internal register file, which is an array of M registers, each of N bits. The register file is initialized to 0 when the reset signal is asserted. The module performs read and write operations on the register file based on the control signals.

The module can be made size-independent by commenting out the line "input [4:0] RW, R1, R2;" and uncommenting the line "// input [$clog2(N):0] RW, R1, R2;".

# Usage
To use the top_Register_2R1W module, instantiate it in a higher-level module or testbench and connect its input and output ports to other modules or signals as required.

# Testing
The module can be tested by applying input signals and verifying the output signals. A Testbench is provided for checking the modules correctness. The functionality of the module can be verified by simulating it using any Verilog simulator and checking the simulation results.
