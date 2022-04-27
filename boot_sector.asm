loop:                        ; Define a label that we can jump back to.
    jmp loop                 ; Use a simple CPU instruction to jump back to the label.


times 510-($-$$)             ; Tell the assembler to pad out the program with zeroes
                             ; (everything after the instructions but before the magic number)

dw 0xaa55                    ; Make the last two bytes form the magic number.

