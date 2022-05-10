;//Aaron Lim
;//CSIS-118B-4179
;//September 12, 2014
;//Practice_4: AddThree

INCLUDE Irvine32.inc

; .386
; .model flat,stdcall
; .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section

	msg1 BYTE "The result of 11+22+33 is ", 0dh,0ah,0
	msg2 BYTE 0dh,0ah,0	
	

.code  		;// write your program here
main proc
	
	mov edx,offset msg1		;//moves into edx register the first message string
	call WriteString		;//moves the message to the console
	mov edx,offset msg2		;//moves into edx register the second message string
	call WriteString		;//moves the message to the console

	mov eax,11 ;//moves into eax register the integer 11
	add eax,22 ;//adds 22 to the eax register
	add eax,33 ;//adds 33 to the eax register
	call WriteInt ;//moves the results of the three inputs of eax to the console

	mov edx,offset msg2		;//moves into edx register the second message string
	call WriteString		;//moves the message to the console



	invoke ExitProcess,0
main endp
end main