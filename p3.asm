global _start

section .data
    FIRST_MESSAGE DB 'Enter your name: '
    FIRST_MESSAGE_LENGHT EQU $-FIRST_MESSAGE
    SECOND_MESSAGE DB 'Hello '
    SECOND_MESSAGE_LENGHT EQU $-SECOND_MESSAGE
    NAME_LENGHT EQU 20

section .bss
    NAME RESB NAME_LENGHT               ;declaring a variable

section .text
    _start:
        call display_first_message
        call read_name
        call display_second_message
        call display_name
        call finish_program

    display_first_message:
        MOV EAX, 0X1                    ;syscall write mode
        MOV EDI, 0X1                    ;standard output
        MOV ESI, FIRST_MESSAGE          ;pointer to the data
        MOV EDX, FIRST_MESSAGE_LENGHT   ;size
        SYSCALL 
        RET

    read_name:
        MOV EAX, 0X0                    ;syscall read mode
        MOV EDI, 0X0                    ;standard input
        MOV ESI, NAME 
        MOV EDX, NAME_LENGHT
        SYSCALL
        RET

    display_second_message:
        MOV EAX, 0X1
        MOV EDI, 0X1
        MOV ESI, SECOND_MESSAGE
        MOV EDX, SECOND_MESSAGE_LENGHT
        SYSCALL
        RET

    display_name:
        MOV EAX, 0X1
        MOV EDI, 0X1
        MOV ESI, NAME
        MOV EDX, NAME_LENGHT
        SYSCALL
        RET
    
    finish_program:
        MOV EAX, 0X3C
        MOV EDI, 0X0
        SYSCALL
        RET

; nasm -f elf64 p3.asm && ld p3.o -o p3 && ./p3

; debugging with gdb

; gdb p3
; break _start
; layout asm
; set disassembly-flavor intel (it will show the debugger with the format of the code instead the default format)
; layout regs
; stepi (it executes each instruction automatically. Just type enter after have been input this command) 
; x/s (memory address located in ESI) (it will display the memory address content)


