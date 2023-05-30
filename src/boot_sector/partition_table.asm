; Setup the MBR
; Pad out for disk time stamp. Should be at byte 218.
times (218 - ($-$$)) nop

DiskTimeStamp: times 8 db 0   ; Create disk time stamp

bootDrive: db 0               ; Drive Number Variable
PToff: dw 0                   ; Partition Table Entry Offset

; Pad out for partition table. Should be at byte 436.
times (436 - ($-$$)) nop

UID: times 10 db 0            ; Unique Disk ID
PT1: times 16 db 0            ; Partition 1
PT2: times 16 db 0            ; Partition 2
PT3: times 16 db 0            ; Partition 3
PT4: times 16 db 0            ; Partition 4

dw 0xaa55                     ; Magic Number / Boot Signature
