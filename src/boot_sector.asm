; A simple boot sector that prints a message to the screen using a BIOS routine.

mov ah, 0x0e  ; int 10/ah = 0eh - > scrolling teletype BIOS routine.

mov bp, 0x8000   ; Set the stack base a little bit above the boot sector (so it doesn't overwrite)
mov sp, bp

push 'A'
push 'B'
push 'C'

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

mov al, [0x7ffe]
int 0x10

mov bx, my_string
mov al, [bx]
int 0x10


my_string:
    db 'Hello World',0       ; Define a null-terminated string.


jmp $        ;Jump to the current address forever.


; Padding and BIOS magic number.
; DO NOT TOUCH

times 510-($-$$) db 0        ; Tell the assembler to pad out the program with zeroes
                             ; (everything after the instructions but before the magic number)

dw 0xaa55                    ; Make the last two bytes form the magic number.
