print_str: ; Function to print a null-terminated string held in a memory address in bx
    pusha         ; Push all registers onto the stack.
    mov ah, 0x0e  ; Set the interrupt for printing

    iterate:
        mov al, [bx]    ; pull a character from the current memory location to register AL
        cmp al, 0       ; return if al is null
        je print_string_end

        call print_char ; print the character in al
        add bx, 1      ; incriment the memory location to the next location TODO - FIXME
        jmp iterate

    print_string_end:
        call print_char
        popa  ; Return all registers to the state they were when the function was called
        ret           ; Jump back to the call statement


print_char: ; Function to print the character in al
    pusha         ; Push all registers to the stack
    mov ah, 0x0e  ; Set the interrupt for BIOS tele-type
    int 0x10
    popa          ; Return all registers to the state they were when the function was called
    ret           ; Jump back to the call statement

