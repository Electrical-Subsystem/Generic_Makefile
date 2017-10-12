# Generic Makefile

This make file has two parts

- Makefile (the regilar one)
- compile.sh

``` bash
	for i in $A; do
		$CC -g -mmcu=$MU -Os   -c $i -o $OBJDIR/${i%.c}.o
	done
``` 
This part of the file take care of the custom included .c and .h files

### usage

- make a directory for you codes.
- place all the codes (only .c and .h files!!) in that directory.
- Copy the above "Makefile" and "compile.sh" files into the folder.
- Change the project variable to name of your project
- Change the remaining variable appropriately

Thats it!! you are good to go..!!

### Commands

``` bash
	make all
```

compiles all the code and generates .hex file

``` bash
	make program
```

programs the target device using avrdude


``` bash
	make read
```

reads flash from the target device using avrdude

``` bash
	make erase
```

erases target device flash


IMPORTANT INSTRUCTION !!!:

- change the permissions for compile.sh file by using,

``` bash
	chmod 755 compile.sh
``` 
- this will make the compile.sh file executable
