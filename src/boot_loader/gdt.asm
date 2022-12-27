; GDT - Global Descriptor Table
; Defines overlapping code and data segments required by 32-bit PM.

gdt_start:

gdt_null:            ; Mandatory Null Descriptor
    dd 0x0
    dd 0x0

gdt_code:            ; GDT Code Segment Descriptor
    ; Base: 0x0
    ; Limit: 0xfffff
    ; First Flags: (1001b)
    ;   - present: 1
    ;   - privellage: 00
    ;   - descriptor type: 1
    ; Type Flags: (1010b)
    ;   - code: 1
    ;   - conforming: 0
    ;   - writeable: 1
    ;   - accessed: 0
    ; Second Flags: (1100b)
    ;   - granularity: 1
    ;   - 32-bit default: 1
    ;   - 64-bit segment: 0
    ;   - AVL: 0

    dw 0xfffff        ; Limit
    dw 0x0           ; Base
    dw 0x0           ; Base
    db 10011010b     ; First Flags | Type Flags
    db 11001111b     ; Second Flags | Limit
    db 0x0           ; Base

gdt_data:            ; GDT Data Segment Descriptor.
    ; Identical to gdt_code except type flags.
    ; Base: 0x0
    ; Limit: 0xfffff
    ; First Flags: (1001b)
    ;   - present: 1
    ;   - privellage: 00
    ;   - descriptor type: 1
    ; Type Flags: (0010b)
    ;   - code: 0
    ;   - conforming: 0
    ;   - writeable: 1
    ;   - accessed: 0
    ; Second Flage: (1100b)
    ;   - granularity: 1
    ;   - 32-bit default: 1
    ;   - 64-bit segment: 0
    ;   - AVL: 0
    dw 0xfffff        ; Limit
    dw 0x0           ; Base
    dw 0x0           ; Base
    db 10011100b     ; First Flags | Type Flags
    db 11001111b     ; Second Flags | Limit
    db 0x0           ; Base

gdt_end:             ; End of the GDT


gdt_descriptor:        ; GDT Descriptor
    dw gdt_end - gdt_start - 1 ; The size of the GDT. Always one less.
    dd gdt_start     ; The start address for the gdt.

; Define constants for the descriptor offsets.
; These are used by segment registers while in protected mode.
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
