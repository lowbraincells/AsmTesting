test:
	nasm -f elf64 -o lib1.o lib1.asm
	ar rcs lib1.a lib1.o
	nasm -f elf64 -o main.o main.asm
	gcc -o main main.o -L. -l1