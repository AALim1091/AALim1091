;//Aaron Lim
;//CSIS-118B-4179
;//October 27, 2014
;//Lab_10: Encryption/Decryption

;//place string al, and key in cl
;// make two loops, one for positive and one for negative

INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data         ;//write your data in this section
   
buffer BYTE 41 DUP(0) ;//input buffer
byteCount DWORD ? ;//holds counter
key DWORD 8 DUP(0)

msg1 BYTE "Please enter a text, no more than 40 characters ", 0dh,0ah,0                                            ;//string BYTE
msg2 BYTE "Please enter a key (8 numbers maximum) ",0dh,0ah,0                ;//string BYTE   
msg3 BYTE "This is your text:  ",0dh,0ah,0
msg4 BYTE "This is the encrypted text:  ",0dh,0ah,0
msg5 BYTE "This is the decrypted text:  ",0dh,0ah,0               


;//formatting strings
endl BYTE 0dh,0ah,0                                                                                            ;//string BYTE
tabr BYTE 9h                   

.code          ;//write your program here
main proc
   
    mov edx,offset msg1                                                                                        ;//moves into edx register the endl message string
    call WriteString                                                                                        ;//writes message to the console
    mov edx,offset endl                                                                                        ;//moves into edx register the endl message string
    call WriteString

    mov edx,OFFSET buffer                ;//point to the buffer
    mov ecx,SIZEOF buffer            ;//specify max characters
    call Readstring                    ;//input string
    mov byteCount,eax                ;//number of characters

    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset msg2                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console


    mov esi, OFFSET key
    mov ecx,LENGTHOF key
    mov eax,0

L1:                                                                            ;//being loop
    call ReadInt
    add eax,eax
    mov [esi],eax
    add esi, TYPE key
    loop L1                                                                    ;//repeat for array size

    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset msg3                            ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
           
    mov esi, OFFSET key
    mov ecx,LENGTHOF key
       
    mov edx,offset buffer                        ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console   
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console      

	mov edx,offset msg4                                ;//moves into edx register the endl message string
	call WriteString                                ;//moves the message to the console
	mov edx,offset endl                                ;//moves into edx register the endl message string
	call WriteString                                ;//moves the message to the console


	

    call Encode


	
	
    mov edx,offset buffer                            ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console   
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console


   invoke ExitProcess,0
main endp

Encode PROC


	

    mov esi,OFFSET buffer
	mov edi,OFFSET key
	mov ecx,SIZEOF buffer
	mov edx,SIZEOF key
	pushad
	mov eax,0
   
L1:
	mov bl,[esi + eax]
    cmp bl,0
    je finish
	cmp eax,key[edx]
    je restart
	jmp forward

restart:
	call Encode

forward:
	;//mov cl,key[edi]
	cmp key[edi],0
	jl negLeft
	jmp posRight
	add esi,TYPE BYTE
	add edi, TYPE DWORD


negLeft:
		mov cl,[edi]
        neg cl
		push ecx
		mov ch,[esi + eax]
        rol ch,cl
		pop ecx
		mov ch,cl
        jmp L1

posRight:
        mov cl,[edi]
		push ecx
		mov ch,[esi + eax]
        ror ch,cl
		pop ecx
		mov ch,cl
        jmp L1



	

finish:

popad

ret

Encode ENDP


Wrong PROC

pushad

    mov esi,OFFSET buffer
	mov edi,OFFSET key
	mov eax,0
   
L1:
	;//mov bl,[esi + eax]
    cmp buffer[esi + eax],0
    je finish
	cmp eax,key[edx]
    je restart
	jmp forward

restart:
	call Encode

forward:
	;//mov cl,key[edi]
	cmp key[edi],0
	jl negLeft
	jmp posRight
	add esi,TYPE BYTE
	add edi, TYPE DWORD


negLeft:
		mov ecx,key[edi]
        neg ecx
		push ecx
		mov cl,[edi]
        rol BYTE PTR[esi],cl
		pop ecx
		mov[esi],cl
        jmp finish

posRight:
        mov ecx,key[edi]
		push ecx
		mov cl,[edi]
        rol BYTE PTR[esi],cl
		pop ecx
		mov[esi],cl
		jmp finish



	

finish:

popad

ret

Wrong ENDP


Right PROC


	mov esi,OFFSET buffer
	mov edi,OFFSET key
    

pushad

	mov eax,0
 


L1:
	mov bl,[esi + eax]
    cmp bl,0
    je finish
	
	push eax
	mov ecx,8
	mov edx,0
	div cx
	mov cl,[edi + edx]
	pop eax

	test cl,cl
	jns posRight
	jmp negLeft

negLeft:
        neg cl
		mov ch,[esi + eax]
        rol ch,cl
		mov[esi + eax],ch
goBack:
		inc eax
        jmp L1

posRight:
        mov ch,[esi + eax]
        ror ch,cl
		mov[esi + eax],ch
        jmp goBack



	

finish:

popad

ret

Right ENDP



end main

