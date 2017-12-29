# Generic Makefile

UPDATE:

- The Makefile has been updated.
- There is no need for the "compile.sh" file anymore.
- Linking issues have been sorted

### usage

- make a directory for you codes.
- place all the codes (only .c and .h files!!) in that directory.
- Copy the above "Makefile" into the folder.
- Change the project variable to name of your project
- Change the remaining variables appropriately

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

