;//Aaron Lim
;//CSIS-118B-4179
;//September 12, 2014
;//Lab_4

INCLUDE Irvine32.inc

; .386
; .model flat,stdcall
; .stack 4096
ExitProcess proto,dwExitCode:dword

.data 						;//write your data in this section
	
	msg1 BYTE "Please enter 4 numbers ", 0dh,0ah,0
	msg2 BYTE 0dh,0ah,0	
	msg3 BYTE "The result after adding the first two numbers and subtracting the last two is ", 0dh,0ah,0

	Val1 DWORD ?
	Val2 DWORD ?
	Val3 DWORD ?
	Val4 DWORD ?

.code  						;// write your program here
main proc
		
	call Clrscr				;// clears the screen

	mov edx,offset msg1		;//moves into edx register the first message string
	call WriteString		;//moves the message to the console


	call ReadInt			;//will read the 1st number that was input by the keyboard and place it into eax register
	mov Val1,eax			;//moves the value read by ReadInt into the Val1 variable
	call ReadInt			;//will read the 2nd number that was input by the keyboard and place it into eax register
	mov Val2,eax			;//moves the 2nd value read by ReadInt into the Val2 variable
	call ReadInt			;//will read the 3rd number that was input by the keyboard and place it into eax register
	mov Val3,eax			;//moves the 3rd value read by ReadInt into the Val3 variable
	Call ReadInt			;//will read the 4th number that was input by the keyboard and place it into eax register
	mov Val4,eax			;//moves the 4th calue read by ReadInt into the Val4 variable

	mov eax,Val1			;//moves into eax registry the value placed in the Val1 variable
	add eax,Val2			;//adds into eax registry the value placed in the Val2 variable
	sub eax,Val3			;//subtracts into eax registry the value placed in the Val3 variable
	sub eax,Val4			;//subtracts into eax registry the value placed in the Val4 variable

	
	mov edx,offset msg3		;//moves into edx register the third message string
	call WriteString		;//moves the message to the console
	
	call WriteInt			;//moves the final result of Val1,Val2,Val3, and Val4 to the console

	mov edx,offset msg2		;//moves into edx register the second message string
	call WriteString		;//moves the message to the console

	invoke ExitProcess,0
main endp
end main