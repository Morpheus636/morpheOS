[bits 16]
[org 0x7c00]

; Set the stack for 16 Bit Real Mode
mov bp, 0x9000
mov sp, bp

; Switch to 32 Bit Protected Mode
cli                    ; Disable Interrupts
lgdt [gdt_descriptor]  ; Load the GDT

mov eax, cr0           ; Set the first bit of the control register
or al, 1               ; Set the Protection Enable bit within the control register
mov cr0, eax

jmp CODE_SEG:PM_MAIN   ; Far-Jump to 32-bit Code.

; Imports
%include "src/boot_sector/print.asm"
%include "src/boot_sector/gdt.asm"
%include "src/boot_sector/boot_loader.asm"


[bits 32]
PM_MAIN:
    ; TODO - Set the stack for 32-bit REAL mode.
    ; TODO - Jump to the bootloader.
    jmp $
; THIS IMPORT MUST BE THE END OF THE FILE
%include "src/boot_sector/partition_table.asm"
