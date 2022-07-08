print_str:
    ; Function to print a null-terminated string held in the memory location stored at bx
    ; Args:
    ; - BX: Memory location of null-terminated string
    pusha         ; Push all registers onto the stack.

    print_str_iterate:
        ; Pull a character from memory (Caboose's Mov)
        mov al, [bx]

        ; Return if the character is null (null terminated string)
        cmp al, 0
        je print_string_end

        ; Print the character
        call print_char

        ; Re-iterate starting at the next memory location.
        add bx, 1
        jmp print_str_iterate

    print_string_end:
        ; Print a newline then a carriage return
        mov al, 0xa
        call print_char
        mov al, 0xd
        call print_char
 
        ; Cleanup and return
        popa
        ret



print_hex:
    ; Function to print a hex value from DX as a string (not a character)
    ; Credit to kthompson on GitHub for parts of this function.
    ; Args:
    ; - DX: 16-bits to print (4 digits of hex)
    pusha  ; Push all registers to the stack
    
    ; Iterate 4 times
    mov cx, 4
    print_hex_iterate:
        dec cx  ; decrement the counter for the loop
       
        ; Get 4 bits from DX
        mov ax, dx      ; copy dx to ax so we can mask it for the last chars
        shr dx, 4       ; shift dx 4 bits to the right
        and ax, 0xf     ; mask ax to get the last 4 bits 

        ; Figure out the location to set the character in.
        mov bx, HEX_OUT ; set bx to the mem address of the output string
        add bx, 2       ; skip the 0x at the beginning of the address
        add bx, cx      ; add the current counter to the address
        
        ; Encode the 4 bits as a character into the string
        cmp ax,0xa
        jl set_letter   ; if ax is a number, set it in the output string
        add byte al, 0x27 ; if ax is a letter, add 0x27 for ASCII encoding before setting
        jl set_letter
        
    set_letter:
        ; Set the letter into the string to print
        add al, 0x30    ; Encode the character in ASCII by adding 0x30
        mov byte [bx], al ; Move the character into its position in the string

        cmp cx, 0
        je print_hex_end       ; If the counter is done, return.
        jmp print_hex_iterate  ; Else, loop again

    print_hex_end:
        ; Print the outputted string
        mov bx, HEX_OUT
        call print_str
        ; Cleanup and return
        popa
        ret

    ; Local Variables
    HEX_OUT: db '0x0000',0



print_char:
    ; Function to print a single character from al
    ; Args: 
    ; - AL: Single character to print
    pusha
    
    mov ah, 0x0e  ; Setup 0x10 interrupt for scrolling tele-type
    int 0x10      ; Interrupt 0x10 to print the value of al. 

    ; Cleanup and return
    popa
    ret

