
    .module recumple

    .area PROG (ABS)

    .org 0x250
	.globl imprime
    .globl acabar
    .globl mostrarMes
    .globl comprobar_bisiesto
	.globl sumar_anio
	.globl sumar_mes
	.globl comprobar_mes
	.globl comprobar_dia
	.globl suma_dia
	.globl sumar_iteracion
	.globl sacar_pila
	.globl poner_pila
    .globl daa
    .globl aNo
    .globl mes
    .globl dia
    .globl Ncumples

aNo:            .word 0x1976 	; Año de nacimiento (BCD) 
mes:	    	.word 0x7		; Mes de nacimiento (BCD) 
dia:	        .word 0x27		; Dia de nacimiento (BCD)
Ncumples:     	.byte 0x10		; Numero de Recumples a calcular

programa:
	lds #0xF000
	ldu #0xF100
	lda #0
	sta 0x80
	lbsr poner_pila

bucle_n_cumple:
	lbsr sacar_pila
	lbsr poner_pila
	lbsr sumar_anio
	lbsr sumar_mes
	lbsr comprobar_mes
	lbsr suma_dia
	lbsr comprobar_dia

	lda dia
	lbsr daa
	sta dia
	lbsr imprime
	lbsr imprime_salto
	
	lda mes
	lbsr daa
	sta mes
	lbsr imprime
	lbsr imprime_salto

	;0x19XX/20XX -> daa -> sta ultimo XX -> 1900/2000 -> cmp 0x2000 blo 19 -> 20
	ldd aNo
	exg a,b
	lbsr daa
	sta aNo
	cmpb #0x20
	blo imprime_19
	lda #20
	lbsr imprime
	lda aNo
	lbsr imprime

	;bsr presentar
	lbsr sumar_iteracion
	lda 0x80
	cmpa Ncumples
	bls bucle_n_cumple
	bra acabar

imprime_19:
	lda #19
	lbsr imprime
	lda aNo
	lbsr imprime

imprime_salto:
	lda #'\n
	sta 0xFF00
	rts

acabar: 
	clra
	sta 0xFF01

	.org 0xFFFE
	.word programa

