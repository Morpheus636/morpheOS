[bits 16] 
load_sectors:
    ; Function to load a specified number of sectors from the disk.
    ; Args:
    ;   - DH: Number of sectors to read
    ;   - DL: Boot Drive
    ;   - ES: Segment to load data into
    ;   - BX: Offset applied to segment ES
    ; 
    pusha           ; Push all registers to the stack for safe keeping.
    push dx         ; Push DX to the stack. Used for error checking.

    mov ah, 0x02    ; Select the BIOS read sector function

    ; Select the sectors to read.
    mov al, dh      ; Number of sectors
    mov ch, 0       ; Cylinder
    mov dh, 0       ; Head
    mov cl, 2       ; First Sector
 
    ; Issue the interrupt to call the read sector function;
    int 0x13
    
    ; Error Handling
    ; If the carry flag was set by 0x02, call the disk read error.
    jc disk_read_error

    ; Check that the correct number of sectors were read.
    pop dx          ; Retreive DX from the stack
    cmp al, dh      ; If the incorrect number of sectors were read
    jne incorrect_sectors_error ; Throw the incorrect sectors error
    
    ; Cleanup
    popa            ; Cleanup and reset all registers to their original state.
    ret             ; Return


disk_read_error:
    ; Error handler for the load_sectors function. 
    mov bx, DISK_ERROR_MSG
    call print_str
    jmp $
    DISK_ERROR_MSG db "Disk read error!",0  

incorrect_sectors_error:
    ; Called when the wrong number of sectors are loaded.
    mov bx, SECTORS_ERROR_MSG
    call print_str
    jmp $
    SECTORS_ERROR_MSG db "Incorrect Num of Sectors Read!",0

