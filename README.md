# 16 bit ALU with Zero and Carry flags

Designed a signed 16-bit Arithmetic and Logical Unit (ALU) which computes the following
functions having control bits

* Signed Addition (control input =  00)
* Subtraction (Control input  = 01)
* NAND operation (Control input = 10)
* XOR operation (control input = 11)

Assumed that the inputs are in 2's compliment.

Zero flag is set when the output is 0, and carry flag is set when there is overflow/underflow.

Design a fast adder (Brent Kung) to compute fast addition and subtraction operation.

Used the testbench to verify the design.
