load_kernel:
    ; Function to load and start the kernel from disk.
    pusha

    ; TODO - Write the bootloader
    
    ; Cleanup and return
    popa
    ret


    ; Variable Definitions
    BOOT_DRIVE: db 0
