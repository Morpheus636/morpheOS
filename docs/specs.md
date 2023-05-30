# MorpheOS Specs
## Master Boot Record
The MorpheOS boot sector adheres to the MBR spec, so it contains both
the bootloader code and the partition table.

Upon boot, the first-stage bootloader, residing in the MBR (sector 0), loads the
second-stage bootloader from sectors 1 - 10. From there, the
second-stage bootloader loads the kernel into memory from the /boot
directory of the first partition and passes control to it.

### Disk Table

| Sector | Total Bytes | Description                    |
|--------|-------------|--------------------------------|
|    0   |     512     | MBR and First Stage Bootloader |
|  1-10  |     5120    | Second Stage Bootloader        |
|  11-X  |      X      | Partitions                     |
|________|_____________|________________________________|

### Memory Layout - Boot Loader
