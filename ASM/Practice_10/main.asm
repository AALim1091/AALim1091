;//Aaron Lim
;//CSIS-118B-4179
;//October 27, 2014
;//Practice_10



INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data         ;//write your data in this section
   
;//op1 BYTE 34h,12h,98h,74h,06h,0A4h,0B2h,0A2h
;//op2 BYTE 02h,45h,23h,00h,00h,87h,10h,80h
;//sum BYTE 9 dup(0)
op1 WORD 1234h,7498h,0A406h,0A2B2h  ;//op1 WORD 0A2B2h,0A406h,7498h,1234h
op2 WORD 4502h,0023h,8700,8010h ;//op2 WORD 8010h,8700h,0023h,4502h
sum WORD 5 dup(0)

.code          ;//write your program here
main proc
    mov esi,OFFSET op1        ;//first operand
    mov edi,OFFSET op2        ;//second operand
    mov ebx,OFFSET sum        ;//sum operand
    mov ecx,LENGTHOF op1    ;//number of bytes
    call Extended_Add

;//Display the sum.
   
    mov esi,OFFSET sum
    mov ecx,LENGTHOF sum
    call Display_Sum
    call crlf


Extended_Add PROC

    pushad
    clc ;//clear the Carry Flag

L1: mov ax,[esi] ;//get the first integer
    adc ax,[edi] ;//add the second integer
    pushfd ;//save the Carry Flag
    mov [ebx],ax ;//store partial sum
    add esi,TYPE WORD ;//advance all three pointers
    add edi,TYPE WORD
    add ebx,TYPE WORD
    popfd ;//restore Carry Flag
    loop L1 ;//repeat loop

    mov WORD ptr [ebx],0 ;//clear high byte of sum
    adc WORD ptr [ebx],0 ;//add any leftover carry

    popad

ret
Extended_Add ENDP

Display_Sum PROC

pushad
;//point to the last array element
add esi,SIZEOF sum
sub esi,TYPE WORD
mov ebx,TYPE WORD

L1: mov ax,[esi] ;//get array byte
    call WriteHexB ;//display it
    sub esi,TYPE WORD ;//point to previous byte
    loop L1

    popad
   

ret
Display_Sum ENDP


    invoke ExitProcess,0
main endp
end main