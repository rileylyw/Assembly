#!/bin/bash
arm-none-eabi-as -o euclidian.o -g euclidian.s
arm-none-eabi-ld -o euclidian euclidian.o
qemu-arm -singlestep -g 1234 euclidian &
ps -e | grep qemu

gdb

file euclidian
target remote localhost:1234