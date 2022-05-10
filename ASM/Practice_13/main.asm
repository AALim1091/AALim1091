;//Aaron Lim
;//CSIS-118B-4179
;//November 19, 2014
;//Practice_13: Column Sum Calculation


;//This program demonstrates the use of Base-Index addressing 
;//with a two-dimensional table array of bytes (a byte matrix).

INCLUDE Irvine32.inc

.data
tableB  BYTE  10h,  20h,  30h,  40h,  50h
        BYTE  60h,  70h,  80h,  90h,  0A0h
        BYTE  0B0h, 0C0h, 0D0h, 0E0h, 0F0h
RowSize = 3
ColSize = 5
colIndex DWORD ?
	msg1 BYTE "Enter column number <0 to 4> : ",0
	msg2 BYTE "The sum is: ",0
	msg3 BYTE " For column ",0
	endl BYTE 0dh,0ah,0																			;//endl string

.code
main PROC

;//Demonstrate Base-Index mode:

	mov	  edx,OFFSET msg1			;//"Enter row number:"
	call  WriteString
	call  Readint					;//EAX = row number
	;//mov colIndex, eax
	mov edi,eax

	mov	  ebx,OFFSET tableB
	mov	  ecx,RowSize 
	;//call  calc_row_sum				;//EAX = sum
	call calc_col_sum ;//calculate column sum procedure
   
	mov	  edx,OFFSET msg2			;//"The sum is:"
	call  WriteString
	call  WriteHex					;//write sum in EAX
	mov	  edx,OFFSET msg3			;//"The sum is:"
	call  WriteString
	mov eax,edi
	;//mov eax,colIndex				;// move column index to eax for output
	call WriteInt					;//output to console
	call  Crlf

	exit
main ENDP

calc_col_sum PROC uses ebx ecx edx esi

	mov	 esi,eax		;//column index
	mul	 ecx			;//row index * col size
	;//dec ecx ;//decrements ecx
	;//add	 ebx,eax		;//row offset
	mov	 eax,0		;//accumulator
	add	 ebx,eax ;//add eax to ebx, setting offset of ebx to zero
	
	

L1:	movzx edx,BYTE PTR[ebx + esi]		;//get a byte
	add	 eax,edx						;//add to accumulator
	add esi,colSize ;//add colSize to ebx, in order to count column values
	loop L1 ;//loop until ecx is zero


	ret
calc_col_sum ENDP

;------------------------------------------------------------
calc_row_sum PROC uses ebx ecx edx esi

; Calculates the sum of a row in a byte matrix.
; Receives: EBX = table offset, EAX = row index, 
;		    ECX = row size, in bytes.
; Returns:  EAX holds the sum.
;------------------------------------------------------------

	mul	 ecx			;//row index * row size
	add	 ebx,eax		;//row offset
	mov	 eax,0		;//accumulator
	mov	 esi,0		;//column index

L1:	movzx edx,BYTE PTR[ebx + esi]		;//get a byte
	add	 eax,edx						;//add to accumulator
	inc	 esi							;//next byte in row
	loop L1

	ret
calc_row_sum ENDP

END main