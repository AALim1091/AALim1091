;//Aaron Lim
;//CSIS-118B-4179
;//November 11, 2014
;//Practice_12

;//use practice_8 for help

;//Demonstrate reference parameters   (ArrayFill.asm)

;//This program fills an array with 16-bit randomly generated integers.

INCLUDE Irvine32.inc

.data

	;//count = 100
	count = 16
	intArray WORD count DUP(?)
	element WORD ?
	start WORD ?
	msg1 BYTE "Please Input the array element number that defines the first part of the array <0 to 20> ", 0dh,0ah,0
	msg2 BYTE "Here is the array with random numbers up to FFh in the first part and up to FFFFh in the second part:  ", 0dh,0ah,0
	endl BYTE 0dh,0ah,0


.code
main PROC

	mov edx,offset msg1								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console

	call ReadInt
	mov element,ax
	mov ax,count
	sub ax,element
	mov element,ax
	
	

	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset msg2								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	
	push 0  
	push 5
	push 100h
	call ArrayFill

	

	push OFFSET intarray 
	;//push LENGTHOF intArray 
	;//push 10000h
	;//call ArrayFill
	
	
	
	push OFFSET intArray
	push LENGTHOF IntArray
	call PrintArray

	
	exit

main ENDP


ArrayFill PROC	
	push	ebp
	mov	ebp,esp
	pushad			;//save registers
	mov	esi,[ebp+16]	;//offset of array
	mov	cx,[ebp+12]	;//array size
	cmp cx,0
	je L2
	
L1:	
	;//cmp cx,element
	;//je L2
	mov eax,[ebp + 8]	
	call	RandomRange	;//from the link library
	mov	[esi],eax
	add	esi,TYPE WORD
	cmp cx,0
	jne	L1

L2:
	popad			;//restore registers
	pop	ebp
	ret 16				;//clean up the stack
ArrayFill ENDP

PrintArray PROC                                                                ;//begin the PrintArray Procedure
	push	ebp
	mov	ebp,esp
	pushad			; save registers
	mov	esi,[ebp+12]	; offset of array
	mov	ecx,[ebp+8]	; array size
	cmp	ecx,0		; ECX == 0?
	je	L2			; yes: skip over loop
                                                             

L1:                                                                            ;//begin loop
    movzx eax, WORD PTR [esi]                                                            ;//mov each integer into eax
    add esi, TYPE WORD                                                         ;//point to next integer
    call WriteHex                                                            ;//will write each individual element of the array to the screen 
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
    loop L1                                                                    ;//repeat for array size

L2:	
	mov edx,offset endl								;//moves into edx register the endl message string
	call WriteString
	popad			; restore registers
	pop	ebp
	ret	8			; clean up the stack                                                                      ;//sum is in EAX

   
PrintArray endp 


END main

L2:
	mov	eax,0FFFFh	;//get random 0 - FFFFh
	call	RandomRange	;//from the link library
	mov	[esi],eax
	add	esi,TYPE WORD
	loop	L2