[bits 16]
[org 0x7c00]

; Set the stack
mov bp, 0x9000
mov sp, bp


; Switch to 32 Bit Protected Mode
;call switch_to_pm  ; This should never return.
jmp $

; imports
;%include "src/boot_sector/gdt.asm"
;%include "src/boot_sector/protected_mode.asm"
;%include "src/boot_sector/boot_loader.asm"


;[bits 32]
;BEGIN_PM:
;    jmp $

; THIS IMPORT MUST BE THE END OF THE FILE
%include "src/boot_sector/partition_table.asm"
