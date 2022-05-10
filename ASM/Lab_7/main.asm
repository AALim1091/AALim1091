;//Aaron Lim
;//CSIS-118B-4179
;//October 1, 2014
;//lab_7
INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

intArray DWORD 10 dup(?)

	msg1 BYTE "Please enter your numbers (10 for this assignment) ", 0dh,0ah,0
	msg2 BYTE "Your Array is:  ", 0dh,0ah,0
	msg3 BYTE "Your new array after the specified calculations is:  ", 0dh,0ah,0
	msg7 BYTE ", ",0														;//holds the seventh string message
	endl BYTE 0dh,0ah,0,



.code  		;//write your program here
main proc

	pushad


	mov esi, OFFSET intArray
	mov ecx,LENGTHOF intArray

	call FillArray

	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset msg2								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console


	call PrintArray
	call CalcArray

	

	call PrintArray

	popad

	invoke ExitProcess,0
main endp

;//Fill array proc from previous lab
FillArray PROC                                                                ;//begin the PrintArray Procedure

pushad

    mov edx,offset msg1                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console

    
    mov eax,0                                                                ;//set the sum to zero

L1:                                                                            ;//being loop
    call ReadInt
    mov [esi],eax
    add esi, TYPE intArray
    loop L1                                                                    ;//repeat for array size

 popad  
    ret                                                                        ;//sum is in EAX

FillArray endp                                                                ;//end the PrintArray Procedure


;//print array proc from previous lab
PrintArray PROC                                                                ;//begin the PrintArray Procedure
	
pushad

    mov eax,0                                                                ;//set the sum to zero

L1:                                                                            ;//being loop
    mov eax,[esi]                                                            ;//mov each integer into eax
    add esi, TYPE DWORD                                                         ;//point to next integer
    call WriteInt                                                            ;//will write each individual element of the array to the screen
    mov edx,offset msg7                                                        ;//moves into edx register the first message string
    call WriteString                                                        ;//moves the message to the console
    loop L1                                                                    ;//repeat for array size

 popad   
    ret                                                                        ;//sum is in EAX

   
PrintArray endp                                                                ;//end the PrintArray Procedure

CalcArray PROC																;//begin the PrintArray Procedure


pushad

	mov esi, OFFSET intArray
	mov ecx,LENGTHOF intArray
	mov edi, OFFSET intArray
	mov ecx,LENGTHOF intArray / 2
	
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset msg3								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console

	mov eax,0																;//set the sum to zero
L1:	
	mov eax,[esi]
	add eax,[esi]
	mov ebx,eax
	add eax,[esi + (type esi * (lengthof intarray / 2))]
	sub [esi + (type esi * (lengthof intarray / 2))],ebx
	mov[esi],eax	
	
	add esi, type  DWORD 
	add edi, type DWORD 
	
	loop L1														
	
popad
	ret																		;//sum is in EAX



CalcArray endp																;//end the PrintArray Procedure

end main