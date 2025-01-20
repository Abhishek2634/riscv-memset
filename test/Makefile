CC = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump
CFLAGS = -march=rv32i -mabi=ilp32 -static -fno-builtin
LD_FLAGS = -Ttext 0x0

all: test_memset

test_memset: test_memset.c ../memset.s
	$(CC) $(CFLAGS) -o test_memset test_memset.c ../memset.s

run: test_memset
	qemu-riscv32 ./test_memset

clean:
	rm -f test_memset
