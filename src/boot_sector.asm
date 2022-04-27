mov al, 'H'     ; Set al to what should be printed
call print       ; Run the print function


jmp $        ;Jump to the current address forever.


print:            ; Create a "print function"
    mov ah, 0x0e  ; Set the interrupt for printing
    int 0x10      ; Print the value of al
    ret           ; Jump back to the call statement.


; Padding and BIOS magic number.
; DO NOT TOUCH

times 510-($-$$) db 0        ; Tell the assembler to pad out the program with zeroes
                             ; (everything after the instructions but before the magic number)

dw 0xaa55                    ; Make the last two bytes form the magic number.
