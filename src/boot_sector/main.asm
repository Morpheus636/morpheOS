[bits 16]
[org 0x0600]


pre_copy:
    ; Disable Interrupts
    cli

    ; Zero segment registers
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; Setup Stack
    mov ss, ax
    mov sp, 0x7c00


copy_boot_sector:
    mov di, 0x0600     ; Set destination location to 0x0600
    mov si, 0x7c00     ; Set origin location to 0x7c00
    mov cx, 512        ; Copy all 512 bytes of boot sector
    rep movsb          ; Copy MBR one byte at a time
    jmp 0:post_copy    ; Jump to the copied MBR's post_copy code


post_copy:
    ; Re-Enable Interrupts
    sti

    ; Print the hello messgae.
    mov bx, HELLO_MSG
    call print_str

    ; Load the kernel
    ; It should block until the kernel shuts down.
    call load_kernel


exit:
    mov bx, EXIT_MSG
    call print_str
    jmp $

; String Constants
HELLO_MSG: db 'Why would you do this to yourself',0
EXIT_MSG: db 'Exit',0

;imports
%include "src/boot_sector/print.asm"
%include "src/boot_sector/boot_loader.asm"
; THIS IMPORT MUST BE THE END OF THE FILE
%include "src/boot_sector/partition_table.asm"
