# MorpheOS To-Do

## Bootloader
- [x] First Stage (Sector 0 - 512 Bytes)
    - [x] Real Mode Stack
    - [x] Printing for Debugging
    - [x] Load Second Stage Bootloader to disk
    - [x] Jump to Second Stage Bootloader
- [ ] Second Stage (Sectors 1-10 - 5120 Bytes)
    - [x] Load GDT
    - [x] Enter Protected Mode
    - [x] Set the Stack
    - [ ] Printing Without BIOS
    - [ ] Actual Bootloader
        - [ ] Locate Kernel on Disk
        - [ ] Load Kernel to Beginning of Addressable Memory
    - [x] Pad out to 10 Sectors
- [ ] Kernel
