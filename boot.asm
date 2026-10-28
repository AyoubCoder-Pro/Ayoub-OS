;; boot.asm - Simple multiboot loader
bits 32

SECTION .multiboot
        align 4
        dd 0x1BADB002              ; magic number
        dd 0x00                    ; flags
        dd - (0x1BADB002 + 0x00)   ; checksum

SECTION .text
global start
extern kmain

start:
        cli                        ; block interrupts
        mov esp, stack_space        ; set stack pointer
        call kmain
        hlt                        ; halt the CPU

SECTION .bss
resb 8192                          ; 8KB memory for stack
stack_space:
