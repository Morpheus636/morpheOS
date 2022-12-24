# Assemble the boot sector
dist/bin/boot_sector.bin:
	# Ensure ./dist/bin exists.
	mkdir -p ./dist/bin
	# Assemble the boot sector.
	nasm ./src/boot_sector/main.asm -f bin -o ./dist/bin/boot_sector.bin

dist/bin/boot_loader.bin:
	# Ensure ./dist/bin exists
	mkdir -p ./dist/bin
	# Assemble the boot loader.
	nasm ./src/boot_loader/main.asm -f bin -o ./dist/bin/boot_loader.bin

# Build the bootable disk image, including assembling and compiling the other OS components.
dist/morpheOS.img:
	# Ensure ./dist exists.
	mkdir -p ./dist
	# Assemble and compile all OS components.
	make dist/bin/boot_sector.bin
	make dist/bin/boot_loader.bin
	# Create disk image from binaries.
	cat ./dist/bin/boot_sector.bin > ./dist/morpheOS.img
	cat ./dist/bin/boot_loader.bin >> ./dist/morpheOS.img

# Compile the kernel.
.PHONY: kernel
kernel:
	# Ensure ./dist/bin exists.
	mkdir -p ./dist/bin
	# Compile the kernel.
	echo "Not Implemented Yet"
	exit 1

.PHONY: clean
clean:
	rm -rf dist/
	
# Build the image and run it with qemu.
.PHONY: run
run:
	make clean
	# Build the image.
	make dist/morpheOS.img
	# Run the image.
	qemu-system-x86_64 \
			-drive file=./dist/morpheOS.img,format=raw,index=0,media=disk \
			-d cpu_reset
