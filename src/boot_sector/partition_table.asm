; Setup the MBR
times (218 - ($-$$)) nop      ; Pad out for disk time stamp

DiskTimeStamp: times 8 db 0   ; Create disk time stamp

bootDrive: db 0               ; Drive Number Variable
PToff: dw 0                   ; Partition Table Entry Offset

times (0x1b4 - ($-$$)) nop    ; Pad for MBR Partition Table

UID: times 10 db 0            ; Unique Disk ID
PT1: times 16 db 0            ; Partition 1
PT2: times 16 db 0            ; Partition 2
PT3: times 16 db 0            ; Partition 3
PT4: times 16 db 0            ; Partition 4

dw 0xaa55                     ; Magic Number / Boot Signature
