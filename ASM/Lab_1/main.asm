;//Aaron Lim
;//CSIS-118B-4179
;//August 19, 2014
;//Lab 1

INCLUDE Irvine32.inc


ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

	msg1 BYTE "Welcome to", 0dh,0ah,0
	msg2 BYTE "ASM Programming", 0dh,0ah,0	
	msg3 BYTE 0dh,0ah,0	
	msg4 BYTE "ASM language is fun to work with!", 0dh,0ah,0	

.code  	;//write your program here
main proc

	mov edx,offset msg1		;//moves into edx register the first message string
	call WriteString		;//moves the message to the console
	mov edx,offset msg2		;//moves into edx register the second message string
	call WriteString		;//moves the message to the console
	mov edx,offset msg3		;//moves into edx register the third message string
	call WriteString		;//moves the message to the console
	mov edx,offset msg4		;//moves into edx register the fourth message string
	call WriteString		;//moves the message to the console
	mov edx,offset msg3		;//moves into edx register the third message string
	call WriteString		;//moves the message to the console

	

	invoke ExitProcess,0
main endp
end main

