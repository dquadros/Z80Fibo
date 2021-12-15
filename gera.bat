z80asm -l -b  fibo.asm
appmake +hex --org 0x0000 -b fibo.bin -o fibo.hex
pause
