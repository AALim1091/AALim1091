;//Aaron Lim
;//CSIS-118B-4179
;//August 25, 2014
;//Lab 2

INCLUDE Irvine32.inc


ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section

	msg1 BYTE "Here are my Programming books:", 0dh,0ah,0
	title11 BYTE "Assembly Language For the",0	
	title12 BYTE "x86 Processor (7th edition)",0
	author1 BYTE "Kip Irvine",0
	publisher1 BYTE "Prentice Hall",0
	title21 BYTE "C# 2012 for Programmers",0	
	title22 BYTE "(5th Edition)",0
	author2 BYTE "P. Deitel, H. Deitel",0
	publisher2 BYTE "Prentice Hall",0
	msg BYTE 0dh,0ah,0	;//CR LF
	tabr BYTE 9h ;//TAB

.code  	;//write your program here
main proc
	call Clrscr ;// clears the screen

	mov edx,offset msg1			;//moves into edx register the first message string
	call WriteString			;//writes the message
	mov edx,offset msg			;//moves into edx registery the crlf string
	call WriteString			;//writes the message

	mov edx,offset title11		;//moves into edx register the first part of the book title string
	call WriteString			;//writes the message
	mov edx,offset msg			;//moves into edx registery the crlf string
	call WriteString			;//writes the message

	mov edx,offset title12		;//moves into edx register the second part of the book title string
	call WriteString			;//writes the message
	mov edx,offset tabr			;//moves into edx registery the tab string
	call WriteString			;//writes the message

	mov edx,offset author1		;//moves into edx register the author string
	call WriteString		;//writes the message
	mov edx,offset tabr		;//moves into edx registery the tab string
	call WriteString		;//writes the message
	mov edx,offset tabr		;//moves into edx registery the tab string
	call WriteString		;//writes the message

	mov edx,offset publisher1		;//moves into edx register the publisher string
	call WriteString		;//writes the message
	mov edx,offset tabr		;//moves into edx registery the tab string
	call WriteString		;//writes the message
	mov edx,offset msg		;//moves into edx registery the crlf string
	call WriteString		;//writes the message
	mov edx,offset msg		;//moves into edx registery the crlf string
	call WriteString		;//writes the message


	;//start book number 2


	mov edx,offset title21		;//moves into edx register the first part of the book title string
	call WriteString			;//writes the message
	mov edx,offset msg			;//moves into edx registery the crlf string
	call WriteString			;//writes the message

	mov edx,offset title22		;//moves into edx register the second part of the book title string
	call WriteString			;//writes the message
	mov edx,offset tabr			;//moves into edx registery the tab string
	call WriteString			;//writes the message
	mov edx,offset tabr			;//moves into edx registery the tab string
	call WriteString			;//writes the message
	mov edx,offset tabr			;//moves into edx registery the tab string
	call WriteString			;//writes the message


	mov edx,offset author2		;//moves into edx register the author string
	call WriteString			;//writes the message
	mov edx,offset tabr			;//moves into edx registery the tab string
	call WriteString			;//writes the message
	
	mov edx,offset publisher2		;//moves into edx register the publisher string
	call WriteString			;//writes the message
	mov edx,offset tabr			;//moves into edx registery the tab string
	call WriteString			;//writes the message
	mov edx,offset msg			;//moves into edx registery the crlf string
	call WriteString			;//writes the message
	mov edx,offset msg			;//moves into edx registery the crlf string
	call WriteString			;//writes the message
	

	invoke ExitProcess,0
main endp
end main

