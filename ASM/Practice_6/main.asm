;//Aaron Lim
;//CSIS-118B-4179
;//September 23, 2014
;//Practice_6

ExitProcess proto
WriteInt64 proto
DumpRegs proto
WriteString proto

.data 								;//write your data in this section

intarray QWORD 1000000000000h,2000000000000h,3000000000000h,4000000000000h
			   

    msg1 BYTE "The sum of the array elements: ", 0dh,0ah,0
	msg2 BYTE "The difference of the array elements: ", 0dh,0ah,0
	endl BYTE 0dh,0ah,0,	

.code  								;//write your program here
main proc

	mov rdi,OFFSET intarray			;// RDI = address of intarray
	mov rcx,LENGTHOF intarray		;// initialize loop counter
	mov rax,0						;//sum = 0

	mov rdx,offset msg1				;//moves into edx register the first message string
	call WriteString				;//moves the message to the console

L1:									;//mark beginning of loop
	add rax,[rdi]					;//add an integer
	add rdi,TYPE intarray			;//point to next element
	loop L1							;//repeat until RCX = 0
	mov   ecx,0						;//assign a process return code, exit process return value
	call WriteInt64					;//outputs the result to the console

	

	;//begin code for subtraction of elements

	mov rdi,OFFSET intarray			;// RDI = address of intarray
	mov rcx,LENGTHOF intarray - 1 		;// initialize loop counter
	

	mov rdx,offset endl				;//moves into edx register the endl message string
	call WriteString				;//moves the message to the console
	mov rdx,offset endl				;//moves into edx register the endl message string
	call WriteString				;//moves the message to the console
	mov rdx,offset msg2				;//moves into edx register the second message string
	call WriteString				;//moves the message to the console

L2:									;//Mark beginning of second loop
	mov rax,[rdi]					;//Move first element to rax					
	add rdi,TYPE intarray			;//point to next element
	sub rax,[rdi]					;//subtract an integer
	loop L2							;//repeat until RCX = 0
	call WriteInt64					;//outputs the result to the console

	mov rdx,offset endl				;//moves into edx register the endl message string
	call WriteString				;//moves the message to the console



	call  ExitProcess				;//terminate the program
main endp							;//end main process
end									;//end program
