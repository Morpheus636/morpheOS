# Assemble the boot sector
boot_sector:
	# Ensure ./dist/bin exists.
	mkdir -p ./dist/bin
	# Cleanup old boot sector builds.
	rm -f ./dist/bin/boot_sector.bin
	# Assemble the boot sector.
	nasm ./src/boot_sector/main.asm -f bin -o ./dist/bin/boot_sector.bin

boot_loader:
	# Ensure ./dist/bin exists
	mkdir -p ./dist/bin
	# Cleanup old boot loader builds.
	rm -f ./dist/bin/boot_sector.bin
	# Assemble the boot loader.
	nasm ./src/boot_loader/main.asm -f bin -o ./dist/bin/boot_loader.bin

# Compile the kernel.
kernel:
	# Ensure ./dist/bin exists.
	mkdir -p ./dist/bin
	# Cleanup old kernel builds.
	rm -f ./dist/bin/kernel.bin
	# Compile the kernel.
	echo "Not Implemented Yet"
	exit 1

# Build the bootable disk image, including assembling and compiling the other OS components.
image:
	# Ensure ./dist exists.
	mkdir -p ./dist
	# Cleanup old disk image builds.
	rm -f ./dist/morpheOS.img
	# Assemble and compile all OS components.
	make boot_sector
	#make boot_loader
	# Create disk image from binaries.
	cat ./dist/bin/boot_sector.bin > ./dist/morpheOS.img
	cat ./dist/bin/boot_loader.bin >> ./dist/morpheOS.img

# Build the image and run it with qemu.
run:
	# Build the image.
	make image
	# Run the image.
	qemu-system-x86_64 \
			-drive file=./dist/morpheOS.img,format=raw,index=0,media=disk \
			-d cpu_reset
