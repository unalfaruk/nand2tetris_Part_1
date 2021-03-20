// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//r0 = a
//r1 = b
//r2 = sum

//sum = b+b+b+..(a times)..+b+b =

@R2 
M=0 //sum = 0

(MULLOOP)
	@R0 
	D=M
	@ENDLOOP
	D;JEQ //if r0 = 0, end
	@R1 
	D=M //D = r1
	@R2 
	M=M+D //sum = sum + r1
	@R0
	M=M-1 //r0 = r0 - 1
	D=M //D = r0
	@MULLOOP
	D;JNE //if r0 != 0, go loop
(ENDLOOP)
	@ENDLOOP
	0; JMP
	
	