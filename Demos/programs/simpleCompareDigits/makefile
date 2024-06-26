mainProduction: main.oProduction
	ld -o main compareDigits.o -nostdlib -static -e main
	strip --strip-all main
main.oProduction: compareDigits.asm
	nasm -f elf64 -o compareDigits.o compareDigits.asm
mainDebug: main.oDebug
	gcc -o main compareDigits.o -ggdb -no-pie
main.oDebug: compareDigits.asm
	nasm -f elf64 -g -F dwarf compareDigits.asm -l compareDigits.lst
	