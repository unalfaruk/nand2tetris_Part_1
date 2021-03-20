// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(MAINLOOP)
	@SCREEN
	D=A
	@scraddr
	M=D

	@KBD
	D=M
	
	@PRESSED //Fill white
	D;JNE
	
(SCREENFILLWHT)
	@scraddr
	A=M
	M=0
	
	@1
	D=A
	@scraddr
	M=D+M
	D=M
	
	@24576
	D=D-A
	
	@SCREENFILLWHT
	D;JNE
	
	@MAINLOOP
	0;JEQ

(PRESSED)
	@scraddr
	A=M
	M=-1
	
	@1
	D=A
	@scraddr
	M=D+M
	D=M
	
	@24576
	D=D-A
	
	@PRESSED
	D;JNE
	
	@MAINLOOP
	0;JMP
	
//(PRESSED)
//	@scraddr
//	A=M
//	M=-1
//	@MAINLOOP
//	0;JMP
	
