;//Aaron Lim
;//CSIS-118B-4179
;//November 19, 2014
;//Lab_13

INCLUDE Lab_13.inc
ExitProcess proto,dwExitCode:dword

.data 		;//write your data in this section


.code  		;//write your program here

printText PROC, aPtr: PTR BYTE

	mov edx,aPtr
	call WriteString

	ret
printText endp

end printText