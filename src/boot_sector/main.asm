[bits 16]
[org 0x7c00]
;Remember the boot drive.
mov [BOOT_DRIVE], dl

; Set the stack for 16 Bit Real Mode
mov bp, 0x8000
mov sp, bp

; Load the second stage boot sector to the end of 16-bit addressable memory.
mov bx, 0xffff - 5120  ; Arg for load sectors - Mem Destination
mov dh, 10             ; Arg for load_sectors - Load 10 sectors
mov dl, [BOOT_DRIVE]   ; Arg for load_sectros - Load from the boot drive.
call load_sectors

; Jump to the second stage bootloader.
jmp 0xffff - 5120 + 512

; Variables
BOOT_DRIVE: db 0

; Imports.
%include "src/boot_sector/print.asm"
%include "src/boot_sector/disk.asm"

; This must be last.
%include "src/boot_sector/partition_table.asm"

