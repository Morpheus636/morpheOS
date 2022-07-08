[org 0x7c00] ; Tell the assembler to offset addresses of labels
mov bp, 0x8000  ; Set the base memory location for the stack

mov bx, hello_msg           ; Set al to the address of hello_msg
call print_str              ; Run the print function

jmp $        ;Jump to the current address forever.


; Data
hello_msg: db 'Why would you do this to yourself?',0

; Imports
%include "src/boot_sector/print.asm"
%include "src/boot_sector/disk.asm"


; Padding and BIOS Magic Number
; DO NOT TOUCH
times 510-($-$$) db 0        ; Tell the assembler to pad out the program with zeroes
dw 0xaa55                    ; Make the last two bytes form the magic number.
