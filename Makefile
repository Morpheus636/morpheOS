assemble:
	mkdir -p ./bin
	rm -f ./bin/*
	nasm ./src/boot_sector/main.asm -f bin -o ./bin/boot_sector.bin

run:
	make assemble
	echo "continue" | bochs

