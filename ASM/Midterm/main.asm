;//Aaron Lim
;//CSIS-118B-4179
;//October 5, 2014
;//Midterm_Fibonacci_Numbers

INCLUDE Irvine32.inc

;//.386
;//.model flat,stdcall
;//.stack 4096
ExitProcess proto,dwExitCode:dword

.data																;//write your data in this section

msg1 BYTE "Array 1 ", 0												;//string for array 1
msg2 BYTE "Array 2  ", 0dh,0ah,0									;//string for array 2
msg3 BYTE "The arrays are  ", 0dh,0ah,0								;//string to go before the arrays putput
endl BYTE  0dh,0ah,0												;// end line string
tabr BYTE 9h														;//tab string
array1 DWORD 10 dup(?)												;//array to hold first 10 elements of the fibonacci numbers
array2 DWORD 10 dup(?)												;// array to hold next 10 elements of the fibonaci numbers
var1 DWORD 0														;//variable for first element of the fib numbers
Var2 DWORD 1														;// variable to hold second element of the fib numbers
start DWORD ?														;//variable used to clear eax for data entry

.code  																;//write your program here
main proc															;//begin main proc

call FillArray1														;//fills the first array with the first 10 fib numbers
call FillArray2														;// fills the array with the next 10 fib numbers
call PrintArrays													;// prints both arrays to the console

invoke ExitProcess,0												;//ends program
main endp															;//end main proc


;//begin fillarray1 proc

FillArray1 PROC														;//begin fill array 1 proc

mov esi, OFFSET array1												;//points to the address of the 1st array
mov ecx,LENGTHOF array1												;// sets counter to the length of the 1st array

push esi															;//push esi onto stack
push ecx															;//push ecx onto stack
mov eax,start														;//sets eax to zero to the fib numbers
mov ebx,var2														;// moves the var2 variable into ebx, ebx = 1
mov edi,var1														;//moves the var1 variable into edi, edi = 0	

L1:																	;//begin loop 1

mov [esi],edi														;//moves the value of edi(0) into the first position of the array
mov edi,ebx															;//moves ebx(1) into edi; both edi and ebx now = 1
add eax,[esi]														;//adds esi to eax; eax now equals 0 for loop 1
mov [esi],eax														;//moves eax into the array 1
mov ebx,[esi]														;//moves the element in array1 into ebx; ebx now equals whatever counter is 
mov [esi],eax														;//moves the value of eax into the array
add esi, TYPE array1												;//increments the array

loop L1																;//Loop until ecx equals 0
pop ecx																;//pops ecx back from the stack
pop esi																;//pops esi back from the stack

ret																	;//returns value of procedure
FillArray1 endp														;//end of fillarray1 proc

;//begin fillarray2 proc

FillArray2 PROC														;//begin fillarray2 proc

mov esi, OFFSET array2												;//points to address of array 2
mov ecx,LENGTHOF array2												;//sets counter to lengthof array2

push esi															;//push esi onto stack
push ecx															;//push ecx onto stack

L1:																	;//begin loop1

mov [esi],edi														;//moves current value of edi into array2 element 
mov edi,ebx															;//moves current value of ebx into edi
add eax,[esi]														;//adds array2 element to eax
mov [esi],eax														;//moves value in eax to array2
mov ebx,[esi]														;//moves element in array2 to ebx
mov [esi],eax														;//moves value in eax to array2

add esi, TYPE array2												;//increments to next element of array 2
loop L1																;//loop until ecx equals 0

pop ecx																;//pop ecx back from stack
pop esi																;//pop esi back from stack
ret																	;//returns value produced by procedure

FillArray2 endp														;//ends the fillarray2 proc

;//begin PrintArrays proc

PrintArrays PROC													;//begin the PrintArray Procedure
mov edx,offset endl													;//moves into edx register the endl message string
call WriteString													;//moves the message to the console
mov edx,offset msg3													;//moves into edx register the msg3 string
call WriteString													;//moves the message to the console
mov edx,offset endl													;//moves into edx register the endl message string
call WriteString													;//moves the message to the console

mov eax, yellow														;//moves the color yellow into eax
call SetTextColor													;//sets the text to given color
mov edx,OFFSET msg1													;//moves into edx register the msg1 string
call WriteString													;//moves the message to console
mov edx,OFFSET tabr													;//moves into the edx register the tabr string
call WriteString													;//moves the message to the console
mov eax, green														;//moves the color green into eax
call SetTextColor													;//sets the text to given color
mov edx,OFFSET msg2													;//moves into edx register the msg2 string
call WriteString													;//moves the message to the console

mov esi, OFFSET array1												;//moves the address of array1 into esi
mov ecx,LENGTHOF array1												;//sets count to lenght of array1

mov ebx, OFFSET array2												;//moves the address of array2 into esi
mov ecx,LENGTHOF array2												;//sets count to lenght of array2

L1:																	;//being loop
mov eax, yellow														;//moves the color yellow into eax
call SetTextColor													;//sets the text to given color
mov eax,[esi]														;//movs the address of array1 into eax
call WriteInt														;//will write each individual element of array1 to the screen
mov edx,OFFSET tabr													;//moves into edx the tabr string
call WriteString													;//moves the message to the console
mov edx,OFFSET tabr													;//moves into edx the tabr string
call WriteString													;//moves the message to the console
mov eax, green														;//moves the color green into eax
call SetTextColor													;//sets the text to given color
mov eax,[ebx]														;//moves the address of array2 into eax
call WriteInt														;//will write each individual element of array2 to the screen
mov edx,OFFSET endl													;//moves into edx the endl string
call WriteString													;//moves the message to the console
add esi, TYPE array1												;//point to next element of array1
add ebx,TYPE array2													;//point to next element of array2
loop L1																;//repeat for array size

mov eax, lightGray													;//moves the color lightGray into eax
call SetTextColor													;//sets the text to given color

mov edx,OFFSET endl													;//moves into edx register the endl string
call WriteString													;//writes the string to console

ret																	;//returns values for output
PrintArrays endp													;//end the PrintArray Procedure	

end main															;//ends main

	