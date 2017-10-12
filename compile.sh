A=*.c

PROJECT=test
LINK=avr-objcopy
CC=avr-gcc
MU=atmega128
OBJDIR=build

for i in $A; do
	$CC -g -mmcu=$MU -Os   -c $i -o $OBJDIR/${i%.c}.o
done






