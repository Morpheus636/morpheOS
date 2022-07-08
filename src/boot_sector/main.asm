[org 0x7c00] ; Tell the assembler to offset addresses of labels
mov bp, 0x8000  ; Set the base memory location for the stack

; Print the hello messgae.
mov bx, hello_msg
call print_str

; Load the kernel
; It should block until the kernel shuts down.
call load_kernel


; Exit params
mov bx, exit_msg
call print_str
jmp $


; Variable Definitions
hello_msg: db 'Why would you do this to yourself?',0
exit_msg: db 'Exit',0

; Imports
%include "src/boot_sector/print.asm"
%include "src/boot_sector/boot_loader.asm"
        

; DO NOT TOUCH
; Pad out the boot sector with zeroes then addd the magic number
times 510-($-$$) db 0
dw 0xaa55
