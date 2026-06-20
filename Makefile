all: os.img

# 1. 부트로더 어셈블
boot/boot.bin: boot/boot.asm boot/gdt.asm
	nasm -f bin boot/boot.asm -o boot/boot.bin

# 2. 커널 컴파일
kernel/kernel.o: kernel/kernel.c
	gcc -m32 -ffreestanding -fno-pic -c kernel/kernel.c -o kernel/kernel.o

kernel/vga.o: kernel/vga.c kernel/vga.h
	gcc -m32 -ffreestanding -fno-pic -c kernel/vga.c -o kernel/vga.o

# 3. 커널 링크 (ELF)
kernel/kernel.bin: kernel/kernel.o kernel/vga.o linker.ld
	ld -m elf_i386 -T linker.ld -o kernel/kernel.bin kernel/kernel.o kernel/vga.o

# 4. ELF → flat 바이너리 추출
kernel/kernel.flat: kernel/kernel.bin
	objcopy -O binary kernel/kernel.bin kernel/kernel.flat

# 5. 디스크 이미지 생성 (부트섹터 512B + 커널)
os.img: boot/boot.bin kernel/kernel.flat
	cat boot/boot.bin kernel/kernel.flat > os.img

clean:
	rm -f boot/boot.bin kernel/kernel.o kernel/vga.o kernel/kernel.bin kernel/kernel.flat kernel/kernel os.img

run: os.img
	qemu-system-i386 -fda os.img -boot a
