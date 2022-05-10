;//Aaron Lim
;//CSIS-118B-4179
;//September 29, 2014
;//Practice_7

INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

arrayOne DWORD 1,2,3,4,5,6,7,8,9,10											;//Holds the integers in arrayOne variable
arrayTwo DWORD 11,12,13,14,15,16,17,18,19,20								;//;//Holds the integers in arrayTwo variable
theSum DWORD ?																;//holds the sum of the two arrays
theDiff DWORD ?																;//hold the difference of the two arrays


	msg1 BYTE "This is the first array: ", 0dh,0ah,0						;//holds the first string message
	msg2 BYTE "The first array sum: ", 0dh,0ah,0							;//holds the second string message
	msg3 BYTE "This is the second array: ", 0dh,0ah,0						;//holds the third string message
	msg4 BYTE "The second array sum: ", 0dh,0ah,0							;//holds the fourth string message
	msg5 BYTE "The sum of the two arrays: ", 0dh,0ah,0						;//holds the fifth string message
	msg6 BYTE "The difference of the two arrays: ", 0dh,0ah,0				;//holds the sixth string message
	msg7 BYTE ", ",0														;//holds the seventh string message
	endl BYTE 0dh,0ah,0,													;//hold the endl message
	

.code  		;//write your program here
main proc

	mov edx,offset msg1														;//moves into edx register the first message string
	call WriteString														;//moves the message to the console

	mov esi, OFFSET arrayOne												;//ESi points to arrayOne
	mov ecx,LENGTHOF arrayOne												;//holds the count of arrayOne in ECX
	call PrintArray															;//Prints the elements of arrayOne to the screen

	mov edx,offset endl														;//moves into edx register the ENDL string
	call WriteString														;//moves the message to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console
	mov edx,offset msg2														;//moves into edx register the second message string
	call WriteString														;//moves the message to the console

	mov esi, OFFSET arrayOne												;//ESi points to arrayOne
	mov ecx,LENGTHOF arrayOne												;//holds the count of arrayOne in ECX
	call ArraySum															;//sums up the elements of arrayOne
	add theSum,eax															;//adds the sum of arrayOne into theSum variable
	add theDiff,eax															;//adds the difference of arrayOne into theDiff variable
	call WriteInt															;//Writes the result of ArraySum to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console

	mov edx,offset msg3														;//moves into edx register the third message string
	call WriteString														;//moves the message to the console

	mov esi, OFFSET arrayTwo												;//ESI points to arrayTwo
	mov ecx,LENGTHOF arrayTwo												;//holds the count of arrayTwo
	call PrintArray															;//Prints the elements of arrayTwo to the screen
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console


	mov edx,offset msg4														;//moves into edx register the fourth message string
	call WriteString														;//moves the message to the console
	mov esi, OFFSET arrayTwo												;//ESI points to arrayTwo
	mov ecx,LENGTHOF arrayTwo												;//holds the count of arrayTwo
	call ArraySum															;//sums up the elements in arrayTwo
	add theSum,eax															;//adds the sum of arrayTwo into theSum variable
	sub theDiff,eax															;//subtracts the difference of arrayTwo from the value placed by arrayone and adds the result into theDiff variable
	call WriteInt															;//Writes the result of ArraySum to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console

	mov edx,offset msg5														;//moves into edx register the fifth message string
	call WriteString														;//moves the message to the console
	mov eax,theSum															;//moves the value in theSum variable to eax for output (arrayOne + arrayTwo)
	call WriteInt															;//Writes the value placed in eax from theSum variable to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console

	mov edx,offset msg6														;//moves into edx register the sixth message string
	call WriteString														;//moves the message to the console
	mov eax,theDiff															;//moves the value in theDiff variable to the eax register for output (arrayOne - arrayTwo)
	call WriteInt															;//Writes the value placed in eax from theDiff variable to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console
	mov edx,offset endl														;//moves into edx register the ENDL message string
	call WriteString														;//moves the message to the console







	invoke ExitProcess,0
main endp

ArraySum PROC																;//Begin ArraySum procedure
	push esi																;//save ESI,ECX
	push ecx																;//save the count of the array
	mov eax,0																;//set the sum to zero

L1:																			;//beging loop
	add eax,[esi]														    ;//add each integer to sum
	add esi, TYPE DWORD														;//point to next integer
	loop L1																	;//repeat for array size

	pop ecx																	;//restore ECX,ESI
	pop esi																	;//restore the elements in the array
	ret																		;//sum is in EAX
ArraySum endp																;//end the ArraySum procedure

PrintArray PROC																;//begin the PrintArray Procedure
	push esi																;//save ESI,ECX
	push ecx																;//save the count of the array
	mov eax,0																;//set the sum to zero

L1:																			;//being loop
	mov eax,[esi]															;//mov each integer into eax
	add esi, TYPE DWORD														;//point to next integer
	call WriteInt															;//will write each individual element of the array to the screen
	mov edx,offset msg7														;//moves into edx register the first message string
	call WriteString														;//moves the message to the console
	loop L1																	;//repeat for array size

	pop ecx																	;//restore ECX,ESI
	pop esi																	;//restore the elements in the array
	ret																		;//sum is in EAX
PrintArray endp																;//end the PrintArray Procedure

end main