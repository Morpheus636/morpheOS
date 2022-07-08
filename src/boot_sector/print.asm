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
        mov al, 0xa     ; Print a newline
        call print_char
        mov al, 0xd     ; Print a carriage return
        call print_char
        popa  ; Return all registers to the state they were when the function was called
        ret           ; Jump back to the call statement



print_hex: ; Function to print a hex value from DX as a string (not a character)
    ; Credit to kthompson on GitHub for parts of this function.
    pusha  ; Push all registers to the stack

    mov cx, 4 ; Start the counter for the loop at 4 (4 digits in a hex string)
    print_hex_iterate:
        dec cx          ; decrement the counter for the loop
        
        mov ax, dx      ; copy dx to ax so we can mask it for the last chars
        shr dx, 4       ; shift dx 4 bits to the right
        and ax, 0xf     ; mask ax to get the last 4 bits

        mov bx, HEX_OUT ; set bx to the mem address of the output string
        add bx, 2       ; skip the 0x at the beginning
        add bx, cx      ; add the current counter (CX) to the address

        cmp ax,0xa      ; check if ax has a letter or a number
        jl set_letter   ; if it's a number, set the value
        add byte [bx],7 ; for ASCII letter, add 7
        jl set_letter   ; then set the value
        
    set_letter:
        add byte [bx], al   ; Add the value of the byte to the char at bx

        cmp cx, 0
        je print_hex_end       ; If the counter is done, return.
        jmp print_hex_iterate  ; Else, loop again

    print_hex_end:
        mov bx, HEX_OUT ; Pass the address of the output to print_string
        call print_str  ; Print the output
        popa   ; Return all registers to their original state
        ret    ; Jump back to the call statement

    ;Variable Definitions
    HEX_OUT: db '0x0000',0



print_char: ; Function to print the character in al
    pusha         ; Push all registers to the stack
    mov ah, 0x0e  ; Set the interrupt for BIOS tele-type
    int 0x10      ; Call the interrupt to print
    popa          ; Return all registers to their original state
    ret           ; Jump back to the call statement
