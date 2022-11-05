global _start

section .data
    STRING DB 'Hello, world!', 0xA
    LENGHT EQU $-STRING 

section .text
    _start:
        MOV EAX, 0X1
        MOV EDI, 0X1
        MOV ESI, STRING
        MOV EDX, LENGHT
        SYSCALL
        MOV EAX, 0X3C
        MOV EDI, 0X0
        SYSCALL 


; nasm -f elf64 p2.asm && ld p2.o -o p2 && ./p2