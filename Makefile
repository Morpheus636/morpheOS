boot_loader:
	mkdir -p ./bin
	rm -f ./bin/*
	nasm ./src/boot_sector/main.asm -f bin -o ./bin/boot_sector.bin

kernel:
	echo ""

shell:
	echo ""

build:
	make boot_loader

run:
	make build
	echo "continue" | bochs

