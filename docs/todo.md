# MorpheOS To-Do

## Bootloader
- [ ] First Stage (Sector 0 - 512 Bytes)
    - [x] Real Mode Stack
    - [x] Printing for Debugging
    - [x] Load Second Stage Bootloader to disk
    - [ ] Jump to Second Stage Bootloader
- [ ] Second Stage (Sectors 1-10 - 5120 Bytes)
    - [ ] Enable A20
    - [ ] Load GDT
    - [ ] Enter Protected Mode
    - [ ] Set the Stack
    - [ ] Printing Without BIOS
    - [ ] Locate Kernel
    - [ ] Load Kernel
    - [ ] Pad out to 10 Sectors
- [ ] Kernel
