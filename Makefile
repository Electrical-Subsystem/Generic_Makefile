#  The variable that are to be changed accordingly
PROJECT :=main
MU :=atmega128
PROGRAMMER :=avrispmkII
PART :=m128


# Variables that are most likely to stay the same 
MEMORY :=flash
CC :=avr-gcc
CFLAGS :=-g -mmcu=$(MU) -Os 
LINK :=avr-objcopy
OBJDIR :=build
objects := $(patsubst %.c,$(OBJDIR)/%.o,$(wildcard *.c))


$(OBJDIR)/%.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

all: $(objects)
	$(CC) -g -mmcu=$(MU) -Os -I ./ -o $(OBJDIR)/$(PROJECT).elf $(OBJDIR)/*.o
	$(LINK) -j .text -j .data -O ihex $(OBJDIR)/$(PROJECT).elf $(PROJECT).hex

clean:
	@ rm -f *.hex -R build *.elf *.o

program:
	$(PROGRAM) -p $(PART) -c $(PROGRAMMER) -e -U $(MEMORY):w:$(PROJECT).hex 

read:
	$(PROGRAM) -p $(PART) -c $(PROGRAMMER) -U $(MEMORY):r:$(PROJECT)_READ.hex:h

erase:
	$(PROGRAM) -p $(PART) -c $(PROGRAMMER) -e 