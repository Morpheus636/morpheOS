[bits 16]
cli                    ; Disable interrupts before activating PM
lgdt [gdt_descriptor]  ; Load the GDT

; Set the first bit of cr0 (control register) to enable PM
mov eax, cr0
or eax, 0x1
mov cr0, eax

jmp CODE_SEG:pm_main   ; Far jump to PM code


; Imports
; This section is only imports used in Real Mode.
; Protected Mode imports are within pm_main.asm.
%include "src/boot_loader/pm_main.asm"
%include "src/boot_loader/gdt.asm"

; Pad out to 10 sectors.
times (5120 - ($-$$)) nop
