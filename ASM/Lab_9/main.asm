;//Aaron Lim
;//CSIS-118B-4179
;//October 24, 2014
;//Lab_9: DICE GAME

INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

;//variables to hold values
guess DWORD ?
yes BYTE "y",0
ranNum DWORD ?
bank DWORD 10

welcome BYTE "----WELCOME TO MY DICE GUESSING GAME!----", 0dh,0ah,0
msg1 BYTE "Please enter your guess for the next roll. ", 0dh,0ah,0							                ;//string BYTE
msg2 BYTE "It only costs $1.00 to play, If you are corect I will pay you $10.00: ",0dh,0ah,0				;//string BYTE					
msg3 BYTE "Winner! the dice rolled a ",0																	;//string BYTE
msg4 BYTE "Sorry,the dice rolled a ",0																		;//string BYTE

thanks BYTE "Thanks for playing your bank is $",0															;//string BYTE
bye BYTE "Come back real soon! ", 0dh,0ah,0																	;//string BYTE
empty BYTE "You are out of money, your bank is $",0															;//string BYTE
again BYTE ". Continue? ('y' for yes, 'n' for no)", 0dh,0ah,0												;//string BYTE
Bnk BYTE "Your Bank is $",0																					;//string BYTE
Bnk2 BYTE ".00",0dh,0ah,0																					;//string BYTE

;//formatting strings
endl BYTE 0dh,0ah,0																							;//string BYTE
tabr BYTE 9h																								;//string BYTE

.code  		;//write your program here
main proc

	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//writes message to the console
	mov edx,offset welcome																					;//moves into edx register the welcome message string
	call WriteString																						;//moves the message to the console

	;//produce random number
	mov  eax,6																								;//get random 0 to 5 
    call RandomRange																						;//calls for range 0 to eax
    inc  eax																								;//make range 1 to 6         
    mov  ranNum,eax																							;//save random number  

	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//writes message to the console
	mov edx,offset Bnk																						;//moves into edx register the bnk message string
	call WriteString																						;//moves the message to the console
	mov eax,bank																							;//moves value in bank variable to eax for output
	call WriteInt																							;//writes value in bank to the screen
	mov edx,offset bnk2																						;//moves into edx register the bnk2 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//writes message to the console

	mov edx,offset msg1																						;//moves into edx register the msg1 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//writes message to the console
	mov edx,offset msg2																						;//moves into edx register the msg2 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//writes message to the console

	call ReadInt																							;//askes for input from the user
	mov guess,eax																							;//moves value from user into the guess variable
	mov eax,guess																							;//moves value in guess variable to eax 

L1: ;//condition for comparing user input to dice rolled
	cmp eax,ranNum																							;//compares the value from user to the random number generated
	je win																									;//if equal jump to win label
	jmp lose																								;//else jump to lose label

win: ;//win label
	add bank,10																								;//adds 10 to the value currently in bank
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg3																						;//moves into edx register the msg3 message string
	call WriteString																						;//moves the message to the console
	mov eax,ranNum																							;//moves the random number generated to eax register
	call writeInt																							;//writes value in eax to the console
	call playagain																							;//calls the playagain proc

lose: ;//lose label
	sub bank,1																								;//subtracts 1 from the users bank
	cmp bank,0																								;//compares the value in bank to 0
	je Fin																									;//if bank is empty, jumps to the finish label
	jmp L2																									;//else 

L2: ;//L2 label
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset msg4																						;//moves into edx register the msg4 message string
	call WriteString																						;//moves the message to the console
	mov eax,ranNum																							;//moves the random number generated to eax register
	call writeInt																							;//writes value in eax to the console
	call playagain																							;//calls the playagain proc

Finish: ;//finish label
	call Fin																								;//calls Fin PROC
	
main endp ;//end main PROC


;//procedure


playagain PROC ;//begin playagain PROC

	mov edx,offset again																					;//moves into edx register the again message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	
	call ReadChar																							;//calls for user to input a char 
	call WriteChar																							;//writes the users input onto the screen
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	
	cmp AL,'y'																								;//compares the users input char to the char 'y'
	je back																									;//jump is even to back label
	jmp exitt																								;//else jump to exit label

back: ;//back label
	call randomize																							;//produce a new random number
	call main																								;//calls main PROC/returns to beginning of program

exitt: ;//exitt label
	call Exitt																								;//calls Exitt PROC

ret ;//returns value of PROC
playagain endp ;//end of playagain PROC


;//procedure


fin PROC ;//begin fin PROC

	call crlf																								;//calls clear screen

	mov edx,offset empty																					;//moves into edx register the empty message string
	call WriteString																						;//moves the message to the console
	mov eax,bank																							;//moves value in bank variable to eax for output
	call writeInt																							;//writes value in eax to the console
	mov edx,offset bnk2																						;//moves into edx register the bnk2 message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console
	mov edx,offset bye																						;//moves into edx register the bye message string
	call WriteString																						;//moves the message to the console
	mov edx,offset endl																						;//moves into edx register the endl message string
	call WriteString																						;//moves the message to the console

exit																										;//exits program
ret																											;//return value

fin endp ;//end of fin PROC


;//procedure


Exitt PROC ;//begin exit program proc

	call crlf																									;//calls clear screen

	mov edx,offset thanks																						;//moves into edx register the thanks message string
	call WriteString																							;//moves the message to the console
	mov eax,bank																								;//moves the value currently in bank to eax for output
	call writeInt																								;//writes value in eax to console
	mov edx,offset bnk2																							;//moves into edx register the bnk2 message string
	call WriteString																							;//moves the message to the console
	mov edx,offset endl																							;//moves into edx register the endl message string
	call WriteString																							;//moves the message to the console
	mov edx,offset bye																							;//moves into edx register the bye message string
	call WriteString																							;//moves the message to the console
	mov edx,offset endl																							;//moves into edx register the endl message string
	call WriteString																							;//moves the message to the console

exit																											;//exits program
ret																												;//return value

Exitt endp ;//end of exit program proc


end main