;//Aaron Lim
;//CSIS-118B-4179
;//October 14, 2014
;//Lab_8

INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section
	
intArray DWORD 1,2,3,4,5
task DWORD ?
var1 DWORD ?
var2 DWORD ?


msg1 BYTE "---- Boolean Calculator ---------- ", 0dh,0ah,0							;//string BYTE
msg2 BYTE "1. x AND y ", 0dh,0													;//string BYTE
msg3 BYTE "2. x OR y ", 0dh,0													;//string BYTE
msg4 BYTE "3. Not x ", 0dh,0	
msg5 BYTE "4. x XOR y ",0dh,0													;//string BYTE
msg6 BYTE "5. Exit program ", 0dh,0ah,0												;//string BYTE
msg7 BYTE "Choose an operation by entering an integer from 1 to 5> ",0dh,0ah,0		;//string BYTE
msgAND BYTE "Boolean AND ", 0dh,0													;//string BYTE
msgOR BYTE "Boolean OR ", 0dh,0													;//string BYTE
msgNOT BYTE "Boolean NOT ", 0dh,0	
msgXOR BYTE "Boolean XOR ",0dh,0													;//string BYTE

first BYTE "Input the first 32-bit hexadecimal operand: ",0		;//string BYTE
second BYTE "Input the second 32-bit hexadecimal operand: ",0	;//string BYTE
result BYTE "The 32-bit hexadecimal result is: ",0

comma BYTE ", ",0dh,0ah,0															;//comma string
endl BYTE 0dh,0ah,0																	;//endl string
tabr BYTE 9h																		;//tab string

.code  		;//write your program here
main proc
	
	mov edx,offset msg1																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg2																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg3																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg4																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg5																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg6																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	
	call Choice ;//call choice proc

main endp

Choice PROC ;//begin choice proc

	mov edx,offset msg7																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	
	call ReadHex ;//asks user for input
	mov task,eax ;//moves user input to task variable
	mov eax,task ;//moves value in task to eax register
	
	;//mov ebx,OFFSET intArray
	;//mov ecx,LENGTHOF intarray
push eax ;//push eax onto the stack
L1: ;//loop 1 task
	cmp eax,1 ;//compares value from user to the number 1
	je Andop ;//if equal jumps to Andop label
	cmp eax,2 ;//compares value from user to the number 2
	je Orop ;//if equal jumps to Orop label
	cmp eax,3 ;//compares value from user to the number 3
	je Notop ;//if equal jumps to Notop label
	cmp eax,4 ;//compares value from user to the number 4
	je Xorop ;//if equal jumps to Xorop label
	cmp eax,5 ;//compares value from user to the number 5
	je Exitt ;//if equal jumps to Exitt label

Andop: ;//label
	call Andd ;//calls andd proc
	jmp back ;//jumps to back label
Orop: ;//label
	call Orr ;//calls Orr proc
	jmp back ;//jumps to back label
Notop: ;//label
	call Nott ;//calls Nott proc
	jmp back ;//jumps to back label
Xorop: ;//label
	call Xorr ;//calls Xorr proc
	jmp back ;//jumps to back label
back: ;//label
	call main ;//jumps back to main proc
Exitop: ;//label
	call Exitt ;//calls Exitt proc

pop eax ;//pop eax from the stack
	ret ;//return value

Choice endp ;//end choice proc



Andd PROC


	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msgAND																	;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	call Input ;//call proc for user input

	mov edx,offset result																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov eax,0
	add eax,var1
	AND eax,var2
	call finalval																		;//moves the message to the console
	


ret ;//return value
Andd endp

Orr PROC

	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msgOR																	;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	call Input ;//call proc for user input

	mov edx,offset result																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov eax,0
	add eax,var1
	OR eax,var2
	call finalval																		;//moves the message to the console
ret ;//return value
Orr endp

Nott PROC

	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msgNOT																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	mov edx,offset first																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	call ReadHex
	mov edx,offset result																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	NOT eax
	call finalval																		;//moves the message to the console

ret ;//return value
Nott endp

Xorr PROC

	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msgXOR																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	call Input ;//call proc for user input

	mov edx,offset result																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov eax,0
	add eax,var1
	XOR eax,var2
	call finalval																	;//moves the message to the console

ret ;//return value
Xorr endp

Input PROC

	mov edx,offset first																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	call ReadHex
	mov var1,eax


	mov edx,offset second																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	call ReadHex
	mov var2,eax

ret ;//return value
Input endp

finalval PROC ;//beginf final vall proc

	call WriteHex
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

ret ;//return value
finalval endp ;//end final val proc

Exitt PROC ;//exit program proc

call crlf
exit
ret ;//return value

Exitt endp ;//end of exit program proc


end main