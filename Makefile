PROJECT=test
LINK=avr-objcopy
CC=avr-gcc
MU=atmega128

FILE=$(PROJECT)

OBJDIR = build
 	
all:
	mkdir -p $(OBJDIR)
	# $(CC) -g -mmcu=$(MU) -Os   -c $(PROJECT).c -o $(OBJDIR)/$(PROJECT).o
	./compile.sh 
	$(CC) -g -mmcu=$(MU) -Os -I ./ -o $(OBJDIR)/$(PROJECT).elf $(OBJDIR)/*.o
	$(LINK) -j .text -j .data -O ihex $(OBJDIR)/$(PROJECT).elf $(PROJECT).hex 

clean:
	@ rm -f *.hex -R build *.elf



PROGRAM=avrdude
PART=m128
PROGRAMMER=avrispmkII
MEMORY=flash
program:
	$(PROGRAM) -p $(PART) -c $(PROGRAMMER) -e -U $(MEMORY):w:$(FILE).hex 

read:
	$(PROGRAM) -p $(PART) -c $(PROGRAMMER) -U $(MEMORY):r:$(FILE)_READ.hex:h
erase:
	$(PROGRAM) -p $(PART) -c $(PROGRAMMER) -e 