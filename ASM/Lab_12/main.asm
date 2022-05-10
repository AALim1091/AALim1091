;//Aaron Lim
;//CSIS-118B-4179
;//November 16, 2014
;//lab_12
INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096

FillArray PROTO, aPtr: PTR DWORD, aCount:DWORD, aType:Dword
PrintArray PROTO, aPtr: PTR DWORD, aCount:DWORD, aType:Dword
CalcArray PROTO, aCount:DWORD, aSize: DWORD, aType:Dword,aPtr: PTR DWORD
ShowParams PROTO, numParam:DWORD
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

intArray DWORD 10 dup(?)

	msg1 BYTE "Enter 10 numbers ", 0dh,0ah,0
	msg2 BYTE "Stack after inputArray and ShowParams calls  ", 0dh,0ah,0
	msg3 BYTE "Stack after CalculateElements and ShowParams calls  ", 0dh,0ah,0
	msg4 BYTE "Stack after PrintArray and ShowParams calls  ", 0dh,0ah,0
	Calc BYTE "Calculated Array  ", 0dh,0ah,0

	Stk BYTE "Stack Parameters: ", 0dh,0ah,0
	dash BYTE "----------------------------",0
	msg5 BYTE "Address: ",0
	msg6 BYTE " = ",0
	msg7 BYTE ", ",0														;//holds the seventh string message
	endl BYTE 0dh,0ah,0,



.code  		;//write your program here
main proc

	

	mov edx,offset msg1                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	;//mov esi, OFFSET intArray
	;//mov ecx,LENGTHOF intArray

	;//procedures
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset msg2								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console								
	mov edx,offset stk								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset dash								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console

	
	INVOKE FillArray,
	OFFSET intArray,
	LENGTHOF intArray,
	TYPE intArray
	
	


	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset msg3								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console								
	mov edx,offset stk								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset dash								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console

	INVOKE CalcArray,
	LENGTHOF intArray,
	SIZEOF intArray,
	TYPE intArray,
	OFFSET intArray

	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset Calc                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
 
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset msg4								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console								
	mov edx,offset stk								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset dash								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console

	INVOKE PrintArray,
	OFFSET intArray,
	LENGTHOF intArray,
	TYPE intArray

	

	invoke ExitProcess,0
main endp

;//Fill array proc from previous lab
FillArray PROC, aPtr: PTR DWORD, aCount:DWORD, aType:Dword                                                              ;//begin the PrintArray Procedure


	 INVOKE ShowParams,8

    mov ecx,aCount
	mov esi,aPtr
    ;//mov eax,0                                                                ;//set the sum to zero

L1:                                                                            ;//being loop
    call ReadInt
    mov [esi],eax
    add esi, aType
    loop L1                                                                    ;//repeat for array size

 
	 ;//call cls
  ;//INVOKE ShowParams,8
    ret                                                                        ;//sum is in EAX

FillArray endp                                                               ;//end the PrintArray Procedure


CalcArray PROC, aCount:DWORD, aSize: DWORD, aType:Dword, aPtr: PTR DWORD															;//begin the PrintArray Procedure




	INVOKE ShowParams,9

	mov esi, aPtr
	mov ecx,aCount
	sub ecx,5
	mov edi, aPtr
	mov edx,aSize ;//need to change
	

	mov eax,0																;//set the sum to zero
L1:	
	mov eax,[esi]
	add eax,[esi]
	mov ebx,eax
	add eax,[esi + (type esi * (lengthof intarray / 2))]
	sub [esi + (type esi * (lengthof intarray / 2))],ebx
	mov[esi],eax	
	
	add esi, aType 
	add edi, aType 
	
	loop L1														
	

	ret																		;//sum is in EAX



CalcArray endp																;//end the PrintArray Procedure

;//print array proc from previous lab
PrintArray PROC, aPtr: PTR DWORD, aCount:DWORD, aType:Dword                                                                ;//begin the PrintArray Procedure
	


	INVOKE ShowParams,8

	mov edx,offset endl                                                        ;//moves into edx register the first message string
    call WriteString  

    mov ecx,aCount
	mov esi,aPtr
	mov eax,aType                                                              ;//set the sum to zero

L1:                                                                            ;//being loop
    mov eax,[esi]                                                            ;//mov each integer into eax
    add esi, TYPE DWORD                                                         ;//point to next integer
    call WriteInt                                                            ;//will write each individual element of the array to the screen
    mov edx,offset endl                                                        ;//moves into edx register the first message string
    call WriteString                                                        ;//moves the message to the console
    loop L1                                                                    ;//repeat for array size

   
    ret                                                                        ;//sum is in EAX

   
PrintArray endp                                                                ;//end the PrintArray Procedure

ShowParams PROC	, numParam:DWORD														;//begin the PrintArray Procedure


pushad
	mov esi,[esp + 8]
	mov ecx,numParam

L1:
     mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console                       
	mov edx,offset msg5                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	mov eax,esi
	call WriteHex
	mov edx,offset msg6                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	mov eax,[esi]
	call WriteHex
	add esi,TYPE IntArray
	Loop L1



	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console

popad

	ret																		;//sum is in EAX



ShowParams endp																;//end the PrintArray Procedure


end main