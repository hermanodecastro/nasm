global _start

section .data
    MESSAGE DB 0x48, 0x45, 0x4C, 0X4C, 0x4F, 0X20, 0X57, 0X4F, 0X52, 0X4C, 0X44, 0X21, 0XA
    MESSAGE_LENGHT EQU $-MESSAGE

section .text
    _start:
        MOV EAX, 0X1                    ;syscall write mode
        MOV EDI, 0X1                    ;standard output
        MOV ESI, MESSAGE
        MOV EDX, MESSAGE_LENGHT 
        SYSCALL 

        MOV EAX, 0X3C
        MOV EDI, 0X0
        SYSCALL

; nasm -f elf64 p1.asm && ld p1.o -o p1 && ./p1