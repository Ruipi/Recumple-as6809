all: recumples.s19

recumples.s19: recumples.rel 
	aslink -s recumples.rel 

recumples.rel: recumples.asm
	as6809 -o -l recumples.asm 

.PHONY:	clean
clean:
	rm -f *.hlr *.rel *.rst *.map *.lst
