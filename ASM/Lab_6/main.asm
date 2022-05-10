;//64-bit Assembly Language template 
;//Aaron Lim
;//CSIS-118B-4179
;//September 23, 2014
;//Lab_6

ExitProcess proto
WriteInt64 proto
ReadInt64 proto
WriteString proto

.data 												;//write your data in this section

	msg1 BYTE "How many numbers would you like to enter?///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ", 0dh,0ah,0
	msg2 BYTE "Please Enter the numbers now ", 0dh,0ah,0
	msg3 BYTE "The sum of the numbers and FFh are: ", 0dh,0ah,0
	endl BYTE 0dh,0ah,0,
													
									
	count QWORD ?									;// variable set for amount of numbers to be added together,will become rcx counter for loop
	sum QWORD ?										;//holds the sum of the numbers together in the loop
	val1 QWORD 0FFh									;//0FFh is placed in val1 variable

.code  												;//write your program here
main proc

	mov rdx,offset msg1								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console
	mov rdx,offset endl								;//moves into edx register the endl message string
	call WriteString								;//moves the message to the console

	call ReadInt64									;//calls ReadInt64 to get input from the keyboard
	mov count,rax									;//moves the input into the variable count
	mov rcx,count									;//moves the value of count to the rcx register to become the loop counter
	;//mov rax,0

	mov rdx,offset msg2								;//moves into rdx register the endl message string
	call WriteString								;//moves the message to the console
	mov rdx,offset endl								;//moves into rdx register the endl message string
	call WriteString								;//moves the message to the console

L1:													;//mark the beginning of the loop
	call ReadInt64									;//takes user input from the keyboard
	add sum,rax										;//takes the result of ReadInt64 and stores it into the sum variable
	mov rax,0										;//sets rax to 0, so as not to mess up the addition process
	Loop L1											;//repeat until rcx equals 0, which means taking user input and adding the value to the sum variable

	add rax,sum                                     ;//will add the sum variable to the rax register for output
	add rax,val1									;// adds the value in val1 to the value placed in rax from the sum

	mov   ecx,0										;//assign a process return code

	mov rdx,offset endl								;//moves into rdx register the endl message string
	call WriteString								;//moves the message to the console
	mov rdx,offset msg3								;//moves into rdx register the endl message string
	call WriteString								;//moves the message to the console
	mov rdx,offset endl								;//moves into rdx register the endl message string
	call WriteString								;//moves the message to the console

	call WriteInt64									;//Writes the result from the addition of the array and val1 to the console

	mov rdx,offset endl								;//moves into rdx register the endl message string
	call WriteString								;//moves the message to the console
	mov rdx,offset endl								;//moves into rdx register the endl message string
	call WriteString								;//moves the message to the console
	


	call  ExitProcess								;//terminate the program
main endp											;//end main process
end													;//end program

