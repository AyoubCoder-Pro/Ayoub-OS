#!/bin/bash
# Script to compile the OS and generate ISO

echo "Compiling Assembly Bootloader..."
nasm -f elf32 boot.asm -o boot.o

echo "Compiling C Kernel..."
gcc -m32 -c kernel.c -o kernel.o -std=c99 -ffreestanding -O2 -Wall -Wextra

echo "Linking files into kernel.bin..."
ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o

echo "Creating ISO Directory Structure..."
mkdir -p iso/boot/grub
cp kernel.bin iso/boot/
cp grub.cfg iso/boot/grub/

echo "Generating ISO File using grub-mkrescue..."
grub-mkrescue -o myos.iso iso

echo "Cleanup temporary build files..."
rm -rf boot.o kernel.o kernel.bin iso

echo "SUCCESS: myos.iso has been generated!"
