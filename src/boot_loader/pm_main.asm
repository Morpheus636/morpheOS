[bits 32]
pm_main:
    ; Initialize registers once in PM
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; Set the stack for PM right after the second stage bootloader.
    mov ebp, 0x10000
    mov esp, ebp


    jmp $ ; TODO - Jump to real, functional, PM code


; Imports
; This section only contains Protected Mode Imports.
; Real Mode Imports are within main.asm.
%include "src/boot_loader/display.asm"
