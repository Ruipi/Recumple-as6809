all: recumple.s19

recumple.s19: recumple.rel 
	aslink -s recumple.rel 

recumple.rel: recumple.asm
	as6809 -o -l recumple.asm 

.PHONY:	clean
clean:
	rm -f *.hlr *.rel *.rst *.map *.lst
