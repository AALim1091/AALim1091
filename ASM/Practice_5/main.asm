;//Aaron Lim
;//CSIS-118B-4179
;//September 19, 2014
;//Practice_5:AddSubTest

INCLUDE Irvine32.inc

; .386
; .model flat,stdcall
; .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

	msg BYTE "The result after calculating the expression for Rval is: ", 0dh,0ah,0
	msg2 BYTE 0dh,0ah,0	
	msg3 BYTE "The result after subtracting 1 from the cx register is: ", 0dh,0ah,0
	msg4 BYTE "The result after incrementing ax is: ", 0dh,0ah,0
	msg5 BYTE "The result after adding 2 to the ax register is: ", 0dh,0ah,0
	msg6 BYTE "The result after adding 1 to the al register is: ", 0dh,0ah,0
	msg7 BYTE "The result after subtracting 1 from the al register is: ", 0dh,0ah,0
	
	Rval SDWORD ?
	Xval SDWORD 26
	Yval SDWORD 30
	Zval SDWORD 40

.code  		;//write your program here
main proc
	
;//INC and DEC
	mov ax,1000h
	inc ax									;//1001h
	dec ax									;//1000h
;//Expression: Rval = -Xval + (Yval - Zval)
	mov eax,Xval
	neg eax									;//-26
	mov ebx,Yval
	sub ebx,Zval							;//-10
	add eax,ebx
	mov Rval,eax							;//-36


;//Expression: Rval = Xval + (-Yval - Zval)
	mov eax,Xval ;//moves the value of Xval to the eax registry
	mov ebx,Yval ;//moves the value of Yval to the ebx registry
	neg ebx		 ;//negates or switches the sign of the value placed in the ebx registry
	sub ebx,Zval ;//subtracts the value of Zval from the existing value that was placed into the ebx registry
	add eax,ebx  ;//adds the value of ebx to the value of eax
	mov Rval,eax ;//moves the final value of eax into the variable Rval
	mov edx,offset msg		;//moves into edx register the second message string
	call WriteString		;//moves the message to the console
	call WriteInt ;//moves the result for Rval to the console

	mov edx,offset msg2		;//moves into edx register the second message string
	call WriteString		;//moves the message to the console

;//Zero flag example:
	mov cx,1
	sub cx,1								;//ZF = 1
	call DumpRegs							;//dumps the registers value on the console
	mov edx,offset msg3						;//moves into edx register the message string
	call WriteString						;//moves the message to the console
	mov ax,0FFFFh
	inc ax									;//ZF = 1
	call DumpRegs							;//dumps the registers value on the console
	mov edx,offset msg4						;//moves into edx register the message string
	call WriteString						;//moves the message to the console
;//Sign flag example:
	mov cx,0
	sub cx,1								;//SF = 1
	call DumpRegs							;//dumps the registers value on the console
	mov edx,offset msg3						;//moves into edx register the message string
	call WriteString						;//moves the message to the console
	mov ax,7FFFh
	add ax,2								;//SF = 1
	call DumpRegs							;//dumps the registers value on the console
	mov edx,offset msg5						;//moves into edx register the message string
	call WriteString						;//moves the message to the console
;//Carry flag example:
	mov al,0FFh
	add al,1								;//CF = 1, AL = 00
	call DumpRegs							;//dumps the registers value on the console
	mov edx,offset msg6						;//moves into edx register the message string
	call WriteString						;//moves the message to the console
;//OverFlow flag example:
	mov al,+127
	add al,1								;//OF = 1
	call DumpRegs							;//dumps the registers value on the console
	mov edx,offset msg6						;//moves into edx register the message string
	call WriteString						;//moves the message to the console
	mov al,-128
	sub al,1								;//OF = 1
	call DumpRegs							;//dumps the registers value on the console
	mov edx,offset msg7					;//moves into edx register the message string
	call WriteString						;//moves the message to the console



	invoke ExitProcess,0
main endp
end main