print:            ; Create a "print function"
    pusha         ; Push all registers onto the stack.
    mov ah, 0x0e  ; Set the interrupt for printing
    int 0x10      ; Print the value of al
    popa          ; Pop all registers back from the stack.
    ret           ; Jump back to the call statement.

