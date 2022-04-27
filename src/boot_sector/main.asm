mov al, 'H'     ; Set al to what should be printed
call print       ; Run the print function


jmp $        ;Jump to the current address forever.


; Padding and BIOS magic number.
; DO NOT TOUCH


%include "src/boot_sector/print.asm"

times 510-($-$$) db 0        ; Tell the assembler to pad out the program with zeroes
                             ; (everything after the instructions but before the magic number)

dw 0xaa55                    ; Make the last two bytes form the magic number.
