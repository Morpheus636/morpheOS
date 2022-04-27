; A simple boot sector that prints a message to the screen using a BIOS routine.

mov ah, 0x0e  ; int 10/ah = 0eh - > scrolling teletype BIOS routine.

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 'W'
int 0x10
mov al, 'o'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'd'
int 0x10

jmp $        ;Jump to the current address forever.


; Padding and BIOS magic number.
; DO NOT TOUCH

times 510-($-$$) db 0        ; Tell the assembler to pad out the program with zeroes
                             ; (everything after the instructions but before the magic number)

dw 0xaa55                    ; Make the last two bytes form the magic number.
