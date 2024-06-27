mainProduction: main.oProduction
	ld -o main compareDigits.o libio.o libdata.o -nostdlib -e main
# gcc -o main compareDigits.o libio.o -no-pie	
	strip --strip-all main
main.oProduction: compareDigits.asm
	nasm -f elf64 -o compareDigits.o compareDigits.asm
mainDebug: main.oDebug
	gcc -o main compareDigits.o libio.o -ggdb -no-pie
main.oDebug: compareDigits.asm
	nasm -f elf64 -g -F dwarf compareDigits.asm -l compareDigits.lst
	