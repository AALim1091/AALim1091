
;//Aaron Lim
;//CSIS-118B-4179
;//November 3, 2014
;//Lab_11

INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword


.data         ;//write your data in this section
intArray DWORD 12 DUP(0)
count DWORD 0 ;//holds number of swaps performed

    msg1 BYTE "Please enter 12 numbers with values 0 to 50 ", 0dh,0ah,0
    msg2 BYTE "Before Sort  ", 0dh,0ah,0
    msg3 BYTE "After Sort  ", 0dh,0ah,0
    msg4 BYTE "The number of swaps is:  ",0



    comma BYTE ", ",0                                                        ;//holds the seventh string message
    endl BYTE 0dh,0ah,0,

.code          ;//write your program here
main proc
   
    mov esi, OFFSET intArray
    mov ecx,LENGTHOF intArray

    call FillArray

	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset msg2                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console

    call PrintArray
    call SortArray
    call PrintArray
    call NumSwap

    invoke ExitProcess,0
main endp


;//Fill array proc from previous lab
FillArray PROC                                                                ;//begin the PrintArray Procedure

    mov edx,offset msg1                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console

    push esi                                                                ;//save ESI,ECX
    push ecx                                                                ;//save the count of the array
    mov eax,0                                                                ;//set the sum to zero

L1:                                                                            ;//being loop
    call ReadInt
    mov [esi],eax
    add esi, TYPE intArray
    loop L1                                                                    ;//repeat for array size

    pop ecx                                                                    ;//restore ECX,ESI
    pop esi                                                                    ;//restore the elements in the array
    ret                                                                        ;//sum is in EAX

FillArray endp                                                                ;//end the PrintArray Procedure


;//print array proc from previous lab
PrintArray PROC                                                                ;//begin the PrintArray Procedure
	
    push esi                                                                ;//save ESI,ECX
    push ecx                                                                ;//save the count of the array
    mov eax,0                                                                ;//set the sum to zero

L1:                                                                            ;//being loop
    mov eax,[esi]                                                            ;//mov each integer into eax
    add esi, TYPE DWORD                                                        ;//point to next integer
    call WriteInt                                                            ;//will write each individual element of the array to the screen
    mov edx,offset endl                                                        ;//moves into edx register the first message string
    call WriteString                                                        ;//moves the message to the console
    loop L1                                                                    ;//repeat for array size

    pop ecx                                                                    ;//restore ECX,ESI
    pop esi                                                                    ;//restore the elements in the array
    ret                                                                        ;//sum is in EAX

   
PrintArray endp                                                                ;//end the PrintArray Procedure

SortArray PROC USES ecx ;//pushes ecx, push and pop during proc

;//proc involves inner and outter loop like c++

	mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset msg3                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
   
    mov esi,OFFSET intArray   ;//set esi to address of array
    mov ecx,LENGTHOF intArray - 1 ;//decrement array lenght (in c++ this would be the int j loop)


L1:
    push ecx ;//save register (count)

L2:   
    mov bl,[esi] ;//move position 1 to bl register
    cmp [esi + 4],bl ;//compare bl to second position
    jle next ;//jump if even of less than
    jmp swap ;//else swap

next:
    mov [esi],bl ;//move bl into first position
    add esi,TYPE DWORD ;//increment array
    loop L2

    mov esi, OFFSET intArray ;//readdress esi with address
    pop ecx    ;//pop ecx from stack
    loop L1

jmp exitt ;//exit prcodeure

swap:
    xchg [esi + 4],bl ;//exchange bl with second position
    add count,1 ;//count swap performed
    ;//add esi,TYPE DWORD
    jmp next ;//jump to next label

exitt:

    ret
   
SortArray endp                                                                ;//end the PrintArray Procedure

numSwap PROC

    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
    mov edx,offset msg4                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
	mov eax,0


    mov eax,count ;//move number of count for swaps to eax for output
    call WriteInt ;//output number of swaps
    mov edx,offset endl                                ;//moves into edx register the endl message string
    call WriteString                                ;//moves the message to the console
   
    ret
numSwap endp


end main

