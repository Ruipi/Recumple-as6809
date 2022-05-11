    .module recumple

    .area PROG (ABS)

    .org 0x100
    .globl acabar
    .globl comprobar_bisiesto
    .globl daa

aNo:    .word 0x1976 	; Año de nacimiento (BCD) 
mes:	.word 0x7 		; Mes de nacimiento (BCD) 
dia:	.word 0x27 		; Dia de nacimiento (BCD)
Ncumples:	.byte 0x10 	; Numero de Recumples a calcular

programa:
	lds #0xF000
	lda #1
	sta 0x80

acabar: 
    clra
    sta 0xFF01

    .org 0xFFFE
    .word programa

