;//Aaron Lim
;//CSIS-118B-4179
;//November 3, 2014
;//Practice_11

;//Demonstrate the AddTwo Procedure     (AddTwo.asm)

;//Demonstrates different procedure call protocols.

INCLUDE Irvine32.inc

.data
;//variables
word1 WORD 1234h
word2 WORD 4111h
word3 WORD 1111h ;//added variable for assignment from adding two variables to now three
.code
main PROC

	movzx	eax,word1								;//moves with zero-extend the word1 variable
	push	eax										;//push eax onto the stack
	movzx	eax,word2								;//moves with zero-extend the word2 variable
	push	eax										;//push eax onto the stack
	movzx	eax,word3								;//moves with zero-extend the word3 variable
	push	eax										;//push eax onto the stack
	call	AddThree								;//call procedure
	call	DumpRegs								;//display register values to the console


	call	Example1								;//call procedure
	call	Example2								;//call procedure
	call	Example1								;//call procedure
	call	Example2								;//call procedure

	exit ;//exit program

main ENDP ;//main proc end

;// Call the "C" version of AddTwo

Example1 PROC										;//begin ex1 proc
	push 5											;//push value of 5 to stack
	push 6											;//push value of 6 to stack
	push 1											;//push value of 1 to stack
	call AddThree_C									;//call procedure
	add  esp,12										;// clean up the stack
	call DumpRegs									;// sum is in EAX
	ret												;//return
Example1 ENDP ;//end ex1 proc

;// all the STDCALL version of AddTwo

Example2 PROC	;//being ex2 proc
	push 5											;//push value of 5 to stack
	push 6											;//push value of 6 to stack
	push 3											;//push value of 3 to stack
	call AddThree									;//call procedure
	call DumpRegs									;// sum is in EAX
	ret												;//return
Example2 ENDP ;//end ex2 proc


AddThree_C PROC ;//beging addthree_c proc
;// Adds two integers, return sum in EAX.
;// RET does not clean up the stack.
    push ebp										;//push ebp onto the stack
    mov  ebp,esp									;//moves esp onto ebp
    mov  eax,[ebp + 16]   							;// first parameter
    add  eax,[ebp + 12]								;// second parameter
	add eax,[ebp + 8]								;//third parameter
    pop  ebp										;//pop ebp from stack
    ret												;// caller cleans up the stack
AddThree_C ENDP ;//end addThree_c proc

AddThree PROC ;//begin addThree proc
;// Adds two integers, returns sum in EAX.
;// The RET instruction cleans up the stack.

    push ebp										;//push ebp onto the stack
    mov  ebp,esp									;//moves esp onto ebp
    mov  eax,[ebp + 16]   							;// first parameter
    add  eax,[ebp + 12]								;// second parameter
	add eax,[ebp + 8]								;//third parameter
    pop  ebp										;//pop ebp from stack
    ret  12											;// clean up the stack
AddThree ENDP ;//End addThree proc

END main ;//end program 