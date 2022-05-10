;//Aaron Lim
;//CSIS-118B-4179
;//November 19, 2014
;//Lab_13

INCLUDE Lab_13.inc
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section



.code  		;//write your program here

replaceChar PROC aPtr: PTR BYTE, aChar: BYTE, rChar: BYTE
	
	mov numRep,0
	mov esi,aPtr
	mov ecx, SIZEOF String 
	pushad
	
L1:
	mov bl,aChar
	cmp bl,[esi]
	je Replace
	add esi, TYPE String
	cmp ecx,1
	je endd
	Loop L1

Replace:
	add numRep, 1
	mov bl,rChar
	mov [esi],bl
	INVOKE printText, OFFSET String
	mov edx,offset endl                                                                                       ;//moves into edx register the endl message string
    call WriteString  
	jmp L1

endd:
	popad
	ret
replaceChar endp

end replaceChar