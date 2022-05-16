
    .module recumple

    .area PROG (ABS)

    .org 0x150
    .globl acabar
    .globl mostrarMes
    .globl comprobar_bisiesto
	.globl sumar_anio
	.globl sumar_mes
	.globl comprobar_mes
	.globl comprobar_dia
	.globl suma_dia
	.globl sumar_iteracion
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
	lda #0
	sta 0x80

bucle_n_cumple:
	bsr sumar_anio
	bsr sumar_mes
	bsr comprobar_mes
	bsr suma_dia
	bsr comprobar_dia
	;daa
	;bsr presentar
	bsr sumar_iteracion
	lda 0x80
	cmpa Ncumples
	bls bucle_n_cumple

acabar: 
	clra
	sta 0xFF01

	.org 0xFFFE
	.word programa

