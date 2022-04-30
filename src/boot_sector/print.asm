print_str: ; Function to print a null-terminated string held in a memory address in bx
    pusha         ; Push all registers onto the stack.

   print_str_iterate:
        ; Caboose's Mov:
        mov al, [bx]    ; pull a character from the current memory location to register AL
        cmp al, 0       ; return if al is null
        je print_string_end

        call print_char ; print the character in al
        add bx, 1       ; incriment the memory location to the next character
        jmp print_str_iterate

    print_string_end:
        popa  ; Return all registers to the state they were when the function was called
        ret           ; Jump back to the call statement


print_hex: ; Function to print a hex value from bx as a string (not a character)
    pusha  ; Push all registers to the stack
    ; TODO
    popa   ; Return all registers to their original state
    ret    ; Jump back to the call statement



print_char: ; Function to print the character in al
    pusha         ; Push all registers to the stack
    mov ah, 0x0e  ; Set the interrupt for BIOS tele-type
    int 0x10      ; Call the interrupt to print
    popa          ; Return all registers to their original state
    ret           ; Jump back to the call statement

