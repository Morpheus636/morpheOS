[bits 32]
pm_main:
    ; Initialize registers once in PM
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; Set the stack for PM right at the end of the free space.
    mov ebp, 0x90000
    mov esp, ebp


    jmp $ ; TODO - Jump to real, functional, PM code
