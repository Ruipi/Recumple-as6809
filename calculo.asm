	.module calculo

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

	.globl Ncumples
	.globl aNo
	.globl dia
	.globl mes

enero_str:      .asciz " enero "
febrero_str:    .asciz " febrero "
marzo_str:      .asciz " marzo "
abril_str:      .asciz " abril "
mayo_str:       .asciz " mayo "
junio_str:      .asciz " junio "
julio_str:      .asciz " julio "
agosto_str:     .asciz " agosto "
septiembre_str: .asciz " septiembre "
octubre_str:    .asciz " octubre "
noviembre_str:  .asciz " noviembre "
diciembre_str:  .asciz " diciembre "

poner_pila:
	lda dia
	pshu a
	lda mes
	pshu a
	ldd aNo
	pshu b
	pshu a
	rts 

sacar_pila:
	pulu a
	pulu b
	std aNo
	pulu a
	sta mes
	pulu a
	sta dia
	rts

enero:
	ldx #enero_str
	bra imprimir

febrero:
	ldx #febrero_str
	bra imprimir

marzo:
	ldx #marzo_str
	bra imprimir

abril:
	ldx #abril_str
	bra imprimir

mayo:
	ldx #mayo_str
	bra imprimir

junio:
	ldx #junio_str
	bra imprimir

julio:
	ldx #julio_str
	bra imprimir

agosto:
	ldx #agosto_str
	bra imprimir

septiembre:
	ldx #septiembre_str
	bra imprimir

octubre:
	ldx #octubre_str
	bra imprimir

noviembre:
	ldx #noviembre_str
	bra imprimir

diciembre:
	ldx #diciembre_str
	bra imprimir

mostrarMes:
	ldb mes
	cmpb #0x1
	beq enero
	cmpb #0x2
	beq febrero
	cmpb #0x3
	beq marzo
	cmpb #0x4
	beq abril
	cmpb #0x5
	beq mayo
	cmpb #0x6
	beq junio
	cmpb #0x7
	beq julio
	cmpb #0x8
	beq agosto
	cmpb #0x9
	beq septiembre
	cmpb #0xA
	beq octubre
	cmpb #0xB
	beq noviembre
	bra diciembre

imprimir:
	lda ,x+
	lbeq regresar
	sta 0xFF00
	bra imprimir

sumar_iteracion:
	lda 0x80
	adda #0x01 
	sta 0x80
	rts

sumar_anio:
	ldd aNo,pcr
	exg a,b
	adda 0x80
	lbsr daa
	exg a,b
	adca #0x0
	std aNo
	rts

comprobar_bisiesto:
	ldd aNo
	tfr b,a
	anda #1
	cmpa #0x00
	bne no_bisiesto
	tfr b,a
	lsra
	anda #1
	cmpa #0x00
	bne no_bisiesto
	lda dia
	ldb mes
	cmpa #0x1D	 		;COMPARA DIA CON 29
	lbls regresar 
	suba #0x1D
	addb #0x01
	sta dia
	stb mes
	rts
	
no_bisiesto:
	lda dia
	ldb mes
	suba #0x1C
	addb #0x01
	sta dia
	stb mes
	rts

sumar_mes:
	lda mes
	adda 0x80
	lbsr daa
	sta mes
	rts

comprobar_mes:
	lda mes
	suba #0x12
	bls regresar 
	ldb aNo
	addb #0x1
	sta mes
	stb aNo
	rts

suma_dia:
	lda dia
	adda 0x80
	lbsr daa
	sta dia
	rts

comprobar_dia:
	lda dia
	ldb mes
	cmpa #0x28		;COMPARA EL DIA CON 28
	lbls regresar 
	cmpb #0x02
	lbeq comprobar_bisiesto
	cmpa #0x30		;COMPARA EL DIA CON 30
	lbls regresar 
	cmpb #0x04
	lbeq rest_30_sum_mes
	cmpb #0x06
	lbeq rest_30_sum_mes
	cmpb #0x09
	lbeq rest_30_sum_mes
	cmpb #0x11
	lbeq rest_30_sum_mes
	cmpa #0x31		;COMPARA EL DIA COM 31
	lbls regresar 
	suba #0x31
	addb #0x01
	sta dia
	stb mes
	rts

rest_30_sum_mes:
	suba #0x30
	addb #0x01
	sta dia
	stb mes
	rts
	
regresar:
  	rts
