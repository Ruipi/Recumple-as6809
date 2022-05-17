
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
mes:	    	.word 0x7	; Mes de nacimiento (BCD) 
dia:	        .word 0x27 	; Dia de nacimiento (BCD)
Ncumples:     	.byte 2 	; Numero de Recumples a calcular

programa:
	lda dia+1
        sta dia
	lda mes+1
	sta mes
	ldd aNo
	std aNo
	lds #0xF000
	ldu #0xF100
	lda #0x0
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
	bsr presentar

sumar_iter:
	lbsr sumar_iteracion
	lda 0x80
	cmpa Ncumples
	bls bucle_n_cumple
	bra acabar

imprime_iter:
	lda 0x80
	lbsr imprime	
	rts

imprime_dia:
	lda dia
	lbsr imprime
	rts 

imprime_mes:
	lda mes
	lbsr imprime
	rts

imprime_ano:
	ldd aNo
	cmpa #0x20
	blo imprime_19
	lda #0x20
	lbsr imprime
	ldd aNo
	exg a,b
	lbsr imprime
	rts

imprime_19:
	lda #0x19
	lbsr imprime
	ldd aNo
	exg a,b
	lbsr imprime
	rts
	
imprime_salto:
	lda #'\n
	sta 0xFF00
	rts

presentar:
	bsr imprime_iter
	lda #0x3A
	sta 0xFF00
	lda #0x20
	sta 0xFF00
	bsr imprime_dia
	lda #0x20
	sta 0xFF00
	bsr imprime_de
	lbsr mostrarMes
	bsr imprime_de
	lda #0x20
	sta 0xFF00
	bsr imprime_ano
	bsr imprime_salto
	rts

imprime_de:
	lda #100
	ldb #101
	sta 0xFF00
	stb 0xFF00
	rts
	
acabar: 
	clra
	sta 0xFF01

	.org 0xFFFE
	.word programa

