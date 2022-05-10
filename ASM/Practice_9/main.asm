;//Aaron Lim
;//CSIS-118B-4179
;//October 21, 2014
;//Practice_9

INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

val1 DWORD ?																								;//variable to hold the value
X DWORD ?																									;//variable to hold the value
edxVal DWORD ?																								;//variable to hold the value

;//condition 1: if ebx > ecx
msg1 BYTE "Please enter a number to be placed into the EBX register ", 0dh,0ah,0							;//string BYTE
msg2 BYTE "Now enter a value to be placed into the ECX register ",0dh,0ah,0									;//string BYTE
msg3 BYTE "Since EBX is greater than ECX the result is X = ",0												;//string BYTE
msg4 BYTE "Since EBX is less than the value in ECX the result is invalid ", 0dh,0							;//string BYTE

;//condition 2: if/else edx <= ecx
msg5 BYTE "Enter a value to be placed into the EDX register ",0dh,0ah,0										;//string BYTE
msg6 BYTE "Since EDX is less than or equal to the value in ECX the result is X = ",0						;//string BYTE
msg7 BYTE "Since EDX is greater than the value in ECX the result is X = ",0									;//string BYTE

;//condition 3: if/else (Val > ecx) && (ecx > edx)
msg8 BYTE "Enter a value to be placed into the Val1 variable ",0dh,0ah,0									;//string BYTE
msg9 BYTE "Since (Val1 > ecx) & (ecx > edx) the result is X = ",0											;//string BYTE
msg10 BYTE "Since (Val1 > ecx) & (ecx > edx) is NOT true the result is X = ",0								;//string BYTE

;//dumpregs
Reg BYTE "The values in all the registers are as follows: ",0dh,0ah,0;//string BYTE

;//formattting strings
seperate BYTE "___________________________________________________________________________ ",0dh,0ah,0		;//string to seperate conditions													
endl BYTE 0dh,0ah,0																							;//endl string
tabr BYTE 9h																								;//tab string

.code  		;//write your program here
main proc	;//begin main proc
	
	mov edx,offset msg1																						;//moves into edx register the msg1 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

	call ReadInt																							;//calls for input from the user
	mov ebx,eax																								;//moves the value from the user into the ebx register
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

	mov edx,offset msg2																						;//moves into edx register the msg2 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

	call ReadInt																							;//calls for input from the user
	mov ecx,eax																								;//moves the value from the user into the ecx register
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

	;//begin condition 1
	cmp ebx,ecx																								;//compares EBX register and ECX register
	jg L1																									;//jumps to label 1 if ebx is greater than ecx
	jle No																									;//jumps to 'No' label if ebx is less than ecx 

L1:																											;//label 1
	mov X,1																									;//moves 1 to the X variable
	mov eax,X																								;//moves the value in 'X' to EAX for output
	mov edx,offset msg3																						;//moves into edx register the msg3 message string
	call WriteString																						;//moves the message to the console
	call WriteInt																							;//Writes value in eax to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	jmp Edxecx																								;//jumps to the edxecx label

No:																											;//'No' label
	mov edx,offset msg4																						;//moves into edx register the msg4 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	jmp Edxecx																								;//jumps to the edxecx label

Edxecx:																										;//edxecx label
	call Edxecx																								;//call procedure for next set of conditions

main endp ;//ends main proc

edxecx PROC ;//being edxecx proc

	push ebx																								;//push ebx to the stack
	push ecx																								;//push ecx to the stack
	push edx																								;//push edx to the stack

	mov edx,offset seperate																					;//moves into edx register the seperate message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg5																						;//moves into edx register the msg5 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

	call ReadInt																							;//calls for user input
	mov edx,eax																								;//moves value from user into edx register
	mov edxVal,edx																							;//moves/copies value in edx to the edxVal variable

	cmp edx,ecx																								;//compares edx to ecx
	jle L1																									;//jumps to label 1 if edx is less than or equal to ecx
	mov X,2																									;//else moves 2 into the X variable
	mov eax,X																								;//moves X into eax for output
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg7																						;//moves into edx register the msg7 message string
	call WriteString																						;//moves the message to the console
	call WriteInt																							;//writes value in eax to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	jmp Valecx																								;//jumps to Valecx label

L1:																											;//label 1
	mov X,1																									;//moves the value 1 into the X variable
	mov eax,X																								;//moves X into Eax for output
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg6																						;//moves into edx register the msg6 message string
	call WriteString																						;//moves the message to the console
	call WriteInt																							;//writes the value in eax to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	jmp Valecx																								;//jumps to Valecx label

Valecx:																										;//Valecx label
	call Valecx																								;//calls procedure for next set of conditions

	ret																										;//returns value of procedure

edxecx endp ;//ends edxecx proc

Valecx PROC ;//begin Valecx proc

	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset seperate																					;//moves into edx register the seperate message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg8																						;//moves into edx register the msg8 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

	call ReadInt																							;//calls for user input
	mov Val1,eax																							;//moves the value from the user into the Val1 variable
	mov edx,edxVal																							;//moves the value from edxVal into the edx register for conditions

	;//begin condition 1
	cmp Val1,ecx																							;//compares Val1 to ecx value
	ja L1																									;//jumps to condition 2 label if Val1 is > ecx
	jmp Nope																								;//else jumps to 'Nope' label

L1: ;//condition 2
	cmp ecx,edx																								;//compares value of ecx to value in edx
	ja L2																									;//jumps to L2 if ecx > edx
	jmp Nope																								;//else jumps to 'Nope' Label

L2:																											;//label 2
	mov X,1																									;//moves 1 into X variable
	mov eax,X																								;//moves X into eax for output
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg9																						;//moves into edx register the msg9 message string
	call WriteString																						;//moves the message to the console
	call WriteInt																							;//writes value in Eax to the console
	jmp regVal																								;//jumps to regVal label

Nope:																										;//'Nope' Label
	mov X,2																									;//moves 2 into the X variable
	mov eax,X																								;//Moves X into eax for output
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg10																					;//moves into edx register the msg10 message string
	call WriteString																						;//moves the message to the console
	call WriteInt																							;//writes the value in eax to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	jmp regVal																								;//jumps to regVal label

regVal:																										;//regVal label
	call regVal																								;//calls the procedure that displays the register values

ret																											;// returns value from procedure

Valecx endp ;//end of Valecx procedure

Exitt PROC ;//exit program proc

call crlf																									;//calls clear screen
exit																										;//exits program
ret																											;//return value

Exitt endp ;//end of exit program proc

regVal PROC ;//regVal proc

	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset seperate																					;//moves into edx register the seperate	 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset reg																						;//moves into edx register the reg message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

	call dumpRegs																							;//Dumps the register values to the console for display

	pop edx																									;//pops edx from the stack
	pop ecx																									;//pops ecx from the stack
	pop ebx																									;//pops ebx from the stack

ret																											;// returns value from procedure

regVal endp ;//end of regVal procedure

end main ;//end program