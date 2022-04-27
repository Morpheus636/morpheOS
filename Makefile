build:
	mkdir -p ./bin
	rm -f ./bin/*
	nasm ./src/boot_sector.asm -f bin -o ./bin/boot_sector.bin

run:
	make build
	bochs

