## MacOS
- CPU architecture : ARM64 (aarch64)
- run `test_arm64.s`

```
as -arch arm64 -o test_arm64.o test_arm64.s
gcc test_arm64.o -o test_arm64`
gcc -arch arm64 test_arm64.s -o test_arm64

```


## Linux
- UTM virtual machine + Ubuntu 22.04.5 LTS（JammyJ ellyfish）
- X86_64
- run `test_linux.asm`

```
ld -m elf_i386 test.o -o test 
./test

```
