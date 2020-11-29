# Viru224_Project_1_VHDL
16 bit ALU

Design a signed 16-bit Arithmetic and Logical Unit (ALU) which computes the following
functions. Use Structural VHDL for the design. You are also required to write testbench to
verify your design.

1. Signed Addition (control input S1S0 = 00)
2. Subtraction (Control input S1S0 = 01)
3. NAND operation (Control input S1S0 = 10)
4. XOR operation (control input S1S0 = 11)

The output should be the 16 bit result of the computation and carry (in case of arithmetic
operation) and zero bit. If the result of computation is zero then it should set the zero output
(i.e, z = 1). Assume that the inputs are in 2’s complement form.

Design a fast adder (Brent Kung/ Kogge Stone) to compute addition operation. 

Submission output:
1. VHDL Code
2. Testbench
3. Output waveform
