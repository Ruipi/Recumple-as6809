all: recumple.s19

recumple.s19: recumple.rel imprimir.rel calculo.rel aux.rel
	aslink -smwu recumple.s19 recumple.rel imprimir.rel calculo.rel aux.rel

recumple.rel: recumple.asm
	as6809 -o -l recumple.asm 

imprimir.rel: imprimir.asm
	as6809 -o -l imprimir.asm 

calculo.rel: calculo.asm
	as6809 -o -l calculo.asm

aux.rel: aux.asm
	as6809 -o -l aux.asm
