;//Aaron Lim
;//CSIS-118B-4179
;//September 19, 2014
;//Lab_5


INCLUDE Irvine32.inc

; .386
; .model flat,stdcall
; .stack 4096
ExitProcess proto,dwExitCode:dword

.data 										;//write your data in this section

intArray DWORD 10 DUP(?)


	msg1 BYTE "The entered array is: ", 0dh,0ah,0
	msg2 BYTE "The reversed array is: ", 0dh,0ah,0
	msg3 BYTE 0dh,0ah,0	
	msg4 BYTE "Enter 10 numbers", 0dh,0ah,0
	endl BYTE 0dh,0ah,0
	;//intArray DWORD 0,1,2,3,4,5,6,7,8,9
	

.code  										;//write your program here
main proc

	mov edx,offset msg4					;//moves into edx register the first message string
	call WriteString					;//moves the message to the console
	mov edx,offset msg3					;//moves into edx register the third message string
	call WriteString					;//moves the message to the console
	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console

	
	mov ecx,LENGTHOF intArray				;//loop counter
	mov esi,OFFSET intArray					;//address of intArray
	mov eax,0								;//zero the accumulator
	

L1:
	call ReadInt
	mov [esi],eax						;//add an integer
	add esi, TYPE intArray				;//point to next integer
	loop L1								;//repeat until ecx is zero

	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	mov edx,offset msg1				;//moves into edx register the first message string
	call WriteString					;//moves the message to the console
	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console

	mov ecx,LENGTHOF intArray				;//loop counter
	mov esi,OFFSET intArray					;//address of intArray
	mov eax,0								;//zero the accumulator

L2:
	mov eax,[esi]
	call WriteInt
	add esi, TYPE intArray				;//point to next integer
	Loop L2

	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	mov edx,offset msg2				;//moves into edx register the first message string
	call WriteString					;//moves the message to the console
	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console		
	
	
	mov esi,OFFSET intArray					;//address of intArray
	mov ecx,LENGTHOF intArray				;//loop counter
	;//mov edi,OFFSET intArray					;//address of intArray
	;//mov ecx,LENGTHOF intArray 				;//loop counter
	mov eax,0								;//zero the accumulator

L3:
	mov eax,[esi + (type esi * (lengthof intArray - 1))] 
	call WriteInt
	sub esi, TYPE intArray				;//point to next integer
	Loop L3	

	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console

	invoke ExitProcess,0
main endp
end main

	