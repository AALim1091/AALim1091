

;//Aaron Lim
;//CSIS-118B-4179
;//October 14, 2014
;//Practice_8

																							;// Scanning an Array (ArrayScan.asm)
																							;//Scan an array for the first nonzero value.

INCLUDE Irvine32.inc

																							;//.386
																							;//.model flat,stdcall
																							;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data 																						;//write your data in this section

intArray SWORD 50 dup(?)
searchInt SWORD ?
count SWORD ?
pos SWORD 0
;//intArray SWORD 0,0,0,0,1,20,35,-12,66,4,0
;//intArray SWORD 1,0,0,0 ;//alternate test data
;//intArray SWORD 0,0,0,0 ;//alternate test data
;//intArray SWORD 0,0,0,1 ;//alternate test data
;//noneMsg BYTE "A non-zero value was not found", 0

msg1 BYTE "How many numbers would you like to enter? ", 0dh,0ah,0							;//string BYTE
msg2 BYTE "Please enter the numbers now ", 0dh,0ah,0										;//string BYTE
msg3 BYTE "Your Array is ", 0dh,0ah,0														;//string BYTE
msg4 BYTE "Now enter the number you wish to search for in the array ", 0dh,0ah,0			;//string BYTE
msg5 BYTE "The Number ",0																	;//string BYTE
msg6 BYTE " was not found in this array ", 0dh,0ah,0										;//string BYTE
msg8 BYTE "The number ",0																	;//string BYTE
msg9 BYTE " was found at position ",0														;//string BYTE
comma BYTE ", ",0																			;//comma string
endl BYTE 0dh,0ah,0																			;//endl string
tabr BYTE 9h																				;//tab string

.code  																						;//write your program here
main proc

	mov edx,offset msg1																		;//moves into edx register the msg1 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	call ReadInt																			;//calls Readint to get input from the user
	mov count,ax																			;//takes value from user and stores it into count variable

	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg2																		;//moves into edx register the msg2 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	mov ebx,OFFSET intArray																	;//point to the intArray
	mov cx,count																			;//moves the value in count to cx to become the loop counter
	mov ax,0																				;//clears the ax register

L1:																							;//begin loop 1
	call ReadInt																			;//calls Readint to get input from the user
	mov [ebx],ax																			;//moves the value from the user and stores it into EBX
	add ebx,TYPE SWORD																		;//increments to the next element in Intarray
	Loop L1																					;//loop until count is zero

	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg3																		;//moves into edx register the msg3 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	mov ebx,OFFSET intArray																	;//point to the array
	mov cx,count																			;//loop counter
	mov ax,0																				;//clears register

L2:																							;//being loop 2, print array loop
	mov ax,[ebx]																			;//moves the current value in intArray to ax for output
	add ebx,TYPE SWORD																		;//increments to next element in the array
	call WriteInt																			;//writes each element of array to the console
	mov edx,offset comma																	;//moves into edx register the ecomma message string
	call WriteString																		;//moves the message to the console
	Loop L2																					;//loop until count is zero

	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg4																		;//moves into edx register the msg4 message string
	call WriteString																		;//moves the message to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console

	call Readint																			;//calls Readint to get input from the user
	mov searchInt,ax																		;//moves the value from user into the searchInt variable
	mov ax,searchInt																		;//moves the value of searchInt into the AX register
	
	mov ebx,OFFSET intArray																	;//point to the array
	mov cx,count																			;//loop counter

L3:
	add pos,1
	cmp SWORD PTR [ebx],ax																	;//compare value to value placed in ax
	je found																				;//found a value
	add ebx,2																				;//point to next
	loop L3																					;//loop until count is zero
	jmp notFound																			;//none found

found:																						;//display the value
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,offset msg8																		;//moves into edx register the msg8 message string
	call WriteString																		;//moves the message to the console
	movsx eax,SWORD PTR [ebx]																;//sign-extend into EAX
	call WriteInt																			;//writes the value pointed to by ebx to the console
	mov edx,offset msg9																		;//moves into edx register the msg9 message string
	call WriteString																		;//moves the message to the console
	movsx eax,pos																			;//sign-extend into EAX the current cx value when the number was found (NOTE: counts from right to left in bytes)
	call WriteInt																			;//writes the value pointed to by ebx to the console
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	add ebx,2
	jmp L3
	jmp quit																				;//jump to quit
	
notFound:																					;//display "not found" message
	mov edx,offset endl																		;//moves into edx register the endl message string
	call WriteString																		;//moves the message to the console
	mov edx,OFFSET msg5																		;//moves into edx register the msg5 message string
	call WriteString																		;//moves the message to the console
	mov ax,searchInt																		;//sign-extend into AX the searchIntvalue for output
	call WriteInt																			;//writes the value of ax onto console
	mov edx,OFFSET msg6																		;//moves into edx register the msg6 message string
	call WriteString																		;//moves the message to the console

	
quit:																						;//quit program
	call Crlf																				;//call clear
	exit																					;//exit program


	invoke ExitProcess,0
main endp
end main



;//Aaron Lim
;//CSIS-118B-4179
;//October 27, 2014
;//Practice_10



INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section
	
op1 BYTE 34h,12h,98h,74h,06h,0A4h,0B2h,0A2h
op2 BYTE 02h,45h,23h,00h,00h,87h,10h,80h
sum BYTE 9 dup(0)
;//op1 WORD 3412h,9874h,06A4h,0B2A2h
;//op2 WORD 0245h,2300h,0087h,1080h
;//op1 WORD 0A2B2h,0A406h,7498h,1234h
;//op2 WORD 8010h,8700h,0023h,4502h
;//sum WORD 5 dup(0)

.code  		;//write your program here
main proc
	mov esi,OFFSET op1		;//first operand
	mov edi,OFFSET op2		;//second operand
	mov ebx,OFFSET sum		;//sum operand
	mov ecx,LENGTHOF op1	;//number of bytes
	call Extended_Add

;//Display the sum.
	
	mov esi,OFFSET sum
	mov ecx,LENGTHOF sum
	call Display_Sum
	call crlf


Extended_Add PROC

	pushad
	clc ;//clear the Carry Flag

L1: mov al,[esi] ;//get the first integer
	adc al,[edi] ;//add the second integer
	pushfd ;//save the Carry Flag
	mov [ebx],al ;//store partial sum
	add esi,TYPE BYTE ;//advance all three pointers
	add edi,TYPE BYTE
	add ebx,TYPE BYTE
	popfd ;//restore Carry Flag
	loop L1 ;//repeat loop

	mov BYTE ptr [ebx],0 ;//clear high byte of sum
	adc BYTE ptr [ebx],0 ;//add any leftover carry

	popad

ret
Extended_Add ENDP

Display_Sum PROC

pushad
;//point to the last array element
add esi,ecx
sub esi,TYPE BYTE
mov ebx,TYPE BYTE

L1: mov al,[esi] ;//get array byte
	call WriteHexB ;//display it
	sub esi,TYPE BYTE ;//point to previous byte
	loop L1

	popad
	

ret
Display_Sum ENDP


	invoke ExitProcess,0
main endp
end main