;//Aaron Lim
;//CSIS-118B-4179
;//December 15, 2014
;//FINAL

INCLUDE Irvine32.inc

ExitProcess proto,dwExitCode:dword

;//ProtoTypes
arrayFill PROTO
PrintArray PROTO aPtr:DWORD,cLength:DWORD,rLength:DWORD,aType:DWORD
ProcessArray PROTO mPtr:DWORD,tPtr:DWORD,mSize:DWORD,aType:DWORD, tLength:DWORD, stopPtr:DWORD, tStopPtr:DWORD, mColPtr:DWORD
PrintCoord PROTO mval:DWORD, loc:DWORD, aType:DWORD, mColPtr:DWORD

.data 		;//write your data in this section

mArray DWORD 256 DUP(?)																			;//main array
tArray DWORD 8 DUP(?)																			;//target array

mRow DWORD 16																					;//main row
mCol DWORD 16																					;// main column

tRow DWORD 1																					;//target row
tCol DWORD 8																					;//target column

stop DWORD ?																					;//stop point for main array
tStop DWORD ?																					;//stop point for target array

repVal DWORD 1000																				;//replacement value

;//extra credit variable
numF DWORD 0																					;//3 of found elements

mArr BYTE "Main Array ", 0dh,0ah,0																;//string BYTE
tArr BYTE "Target Array ",0dh,0ah,0																;//string BYTE
Found BYTE "Here are the found values and coordinates ", 0dh,0ah,0							    ;//string BYTE
Value BYTE "Value ",0																			;//string BYTE
Row BYTE "Row ",0																				;//string BYTE
Column BYTE "Column ",0dh,0ah,0																	;//string BYTE
afSort BYTE "Main Array After Sort ", 0dh,0ah,0													;//string BYTE
notFound BYTE "There were no matches between the two arrays ", 0dh,0ah,0						;//string BYTE
numCoord BYTE "The number of found coordinates are: ", 0dh,0ah,0                                ;//string BYTE

;//formatting strings
endl BYTE 0dh,0ah,0																				;//string BYTE
tabr BYTE 9h																				    ;//tab string

.code  		;//write your program here
main proc
	
	mov edx, OFFSET mArr																		;//mov offset of mArr to edx for output
	call WriteString																			;//writestring to console
	PUSH TYPE mArray																			;//push to stack
	PUSH OFFSET mArray																			;//push to stack
	PUSH LENGTHOF mArray																		;//push to stack
	call arrayFill																				;//call arrayFill procedure

	mov eax,mRow																				;//mov # of rows in main array to eax
	mul mCol																					;//multiply by # of columns in main array
	mov stop,eax																				;//move multiplication to stop val
	INVOKE PrintArray,																			;//Invoke procedure
	ADDR mArray,																				;//offset mArray
	mRow,																						;//num of rows
	mCol,																						;//num of cols
	TYPE mArray																					;//type of array

	mov edx, OFFSET tArr																		;//move string for output
	call WriteString																			;//write to console
	PUSH TYPE tArray																			;//push to stack
	PUSH OFFSET tArray																			;//push to stack
	PUSH LENGTHOF tArray																		;//push to stack
	call arrayFill																				;//call arrayFill

	mov eax,tCol																				;//mov target array column # to eax
	mov tStop,eax																				;//move to tStop for stop point	
	INVOKE PrintArray,																			;//Invoke procedure
	ADDR tArray,																				;//offset tArray
	tRow,																						;//target # rows
	tCol,																						;//target # columns
	TYPE tArray																					;//type of target array

	INVOKE ProcessArray,																		;//Invoke procedure
	ADDR mArray,																				;//offset of main array
	ADDR tArray,																				;//offset of target array
	SIZEOF mArray,																				;//size of main array
	TYPE mArray,																				;//type of main array
	LENGTHOF tArray,																			;//lengthof target array
	stop,tStop,mCol																				;//stop point, target stop point, main array # of columns

	mov edx, OFFSET afSort																		;//move string to edx
	call WriteString																			;//write to console	
	INVOKE PrintArray,																			;//Invoke procedure
	ADDR mArray,																				;//main array offset
	mRow,																						;//# or rows, main array
	mCol,																						;//# of columns, main array
	TYPE mArray																					;//type of main array

	mov edx, OFFSET numCoord																	;//move string to edx
	call WriteString																			;//write string to console
	mov eax,numF																				;//mov number of coordinates found to eax for output
	call WriteInt																				;//write eax to console
	call crlf																					;//endl
	call crlf																					;//endl

	invoke ExitProcess,0 ;//exit program
main endp

;//arrayFill Proc

arrayFill PROC
push ebp																						;//save ebp 
mov ebp,esp																						;//copy esp to ebp
pushad																							;//save registers
	mov esi, [ebp + 12]																			;//get offset
	mov ecx, [ebp + 8]																			;//get lengthof

	;//produce random number
	call randomize																				;//randomize numbers for each time program is run
L1:	
	mov  eax,101																				;//range 0 to 100
	call RandomRange																			;//set range																					
	mov[esi],eax																				;//move value to offset position of array
	add esi, [ebp + 16]																			;//increment esi by type
loop L1
	
popad																							;//restore registers
pop ebp																							;//restore ebp
ret 12																							;//clean up stack
arrayFill endp

;//PrintArray Proc

PrintArray PROC aPtr:DWORD,cLength:DWORD,rLength:DWORD,aType:DWORD

	mov esi,aPtr																				;//move offset to esi
	mov ecx,cLength																				;//move counter column length
    mov eax,0																					;//set the sum to zero
RRow:
	push ecx																					;//save count
	mov ecx,rLength																				;//move count row length
		Col:
			mov eax,[esi]																		;//move first element to eax for output
			call WriteInt																		;//write to console
			add esi,aType																		;//increment by type
			mov edx, OFFSET tabr																;//allign output
			call WriteString																	;//write to console
		loop Col																				;//loop columns
	pop ecx																						;//restore row count
	call crlf																					;// space rows
loop RRow																						;//loop rows
	call crlf																					;//endl
	call crlf																					;//endl
ret
PrintArray endp

;//processArray Proc

ProcessArray PROC mPtr:DWORD,tPtr:DWORD,mSize:DWORD,aType:DWORD,tLength:DWORD, stopPtr:DWORD, tStopPtr:DWORD, mColPtr:DWORD

mov numF,0																						;//set numF to zero
pushad																							;//save registers

mov ecx,tLength																					;//pointer to target length
mov esi,tPtr																					;//pointer to target array
mov edi,mPtr																					;//pointer to main array
mov edx, 0																						;//set row index to zero

mov eax,stopPtr																					;//stop holds row * col
mul aType																						;// type = DWORD = 4
mov mSize,eax																					;//size of array is determined by # of elements * 4

mov eax,tStopPtr																				;//tStop = colSize of target array
mul aType																						;//multiply tStop by DWORD
mov tStopPtr,eax																				;//move tStop * aType into tStop, tStop = colSize * 4
add tStopPtr,esi																				;//add to address of esi for stop point

mov eax,repVal																					;//move 1000 into eax

	L1:	
		mov ebx, [esi]																			;//mov first element in tArray to ebx
			L2:
				cmp [edi + edx],ebx																;//compare 1st element tArray to fist row,first col mArray 
				jne skip																		;//skip element if not equal
					add numF,1																	;//add 1 to the number of elements found
					Invoke PrintCoord, ebx, edx, aType, mColPtr									;//invoke preocedure
					mov [edi + edx], eax														;//mov 1000 into destination of element
				skip:
				add edx, aType																	;//increment to next val in row
				cmp edx, mSize																	;//compare row val to size of mArray
				jb L2

		add esi,aType																			;//inc esi by DWORD
		mov edx, 0																				;//reset edx
		;//cmp esi,4215816 
		cmp esi, tStopPtr																		;//stop loop if esi address equals address at end of target array
		jae next																				;//jump if above or equal
		Loop L1

next:
	popad																						;//restore registers
	cmp numF,0																					;//compare numbers found to 0
	je noFind																					;// if zero, jump to noFind label
	jmp Done																					;//else jump done

noFind:
	mov edx, OFFSET notFound																	;//set "no find" string to edx for output
	call WriteString																			;//write to console
	call crlf																					;//endl
	exit																						;//exit program

Done:
	call crlf																					;//endl
	call crlf																					;//endl

ret
ProcessArray endp

;//PrintCoord Proc

PrintCoord PROC, mval:DWORD, loc:DWORD, aType:DWORD, mColPtr:DWORD

pushad																							;//save registers
	cmp numF,1																					;//compare numbers found to 1
	ja skipS																					;// if more than one number is found jump to skip string label

	mov edx, OFFSET Found																		;//move found string to edx
	call WriteString																			;//write to console
	mov edx, OFFSET Value																		;//value string
	call WriteString																			;//write to console
	mov edx, offset tabr																		;//tab string
	call WriteString																			;//write to console
	mov edx, OFFSET Row																			;// row string
	call WriteString																			;//write to console
	mov edx, offset tabr																		;//tab string
	call WriteString																			;//write to console
	mov edx, OFFSET Column																		;// column string
	call WriteString																			;//write to console

skipS:
	;//find row(x) coordinates
	mov eax,loc																					;//mov loc value to eax
	sub edx,edx																					;//zero edx register (remainder)
	div aType																					;//divide by type DWORD
	div mColPtr																					;//divide by number of elements in row (column number)
	mov ebx,eax																					;// copy eax to ebx for future use

	;//find column(y) coordinates
	mov eax,loc																					;//move found location to eax
	sub edx,edx																					;//zero edx register (remainder)
	div aType																					;//divide by type DWORD
	inc eax																						;//increment by 1
	cmp eax,mColPtr																				;// compare eax to main array column number
	jbe next																					;//jump if below or equal to next

swap:
	sub eax,mColPtr																				;//subtract column number from eax
	cmp eax,mColPtr																				;// comapare eax to column number
	ja swap																						;//jump if above back to swap
	
next:
	dec eax																						;//decrement value of eax to equal column index
	mov loc,eax																					;// mov to loc variable

	;//Print val,x-coord, y-coord
	mov eax, mval																				;//value
	call WriteInt
	mov edx, offset tabr
	call WriteString
	mov eax, ebx																				;//x-coordinates
	call WriteInt
	mov edx, offset tabr
	call WriteString
	mov eax, loc																				;// y- coordinates
	call WriteInt
	call crlf

popad																							;//restore registers
ret
PrintCoord endp
end main ;//end main


