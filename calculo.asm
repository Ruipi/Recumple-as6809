

	.module calculo

	.globl acabar
	.globl mostrarMes
	.globl comprobar_bisiesto

	.globl Ncumples
	.globl aNo
	.globl dia
	.globl mes

enero_str:      .asciz "enero"
febrero_str:    .asciz "febrero"
marzo_str:      .asciz "marzo"
abril_str:      .asciz "abril"
mayo_str:       .asciz "mayo"
junio_str:      .asciz "junio"
julio_str:      .asciz "julio"
agosto_str:     .asciz "agosto"
septiembre_str: .asciz "septiembre"
octubre_str:    .asciz "octubre"
noviembre_str:  .asciz "noviembre"
diciembre_str:  .asciz "diciembre"

poner_pila:
	lda dia,pcr
	pshs a
	lda mes,pcr
	pshs a
	lda aNo,pcr
	pshs a
	rts 

sacar_pila:
	puls a
	sta aNo,pcr
	puls a
	sta mes,pcr
	puls a
	sta dia,pcr
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
	beq regresar
	sta 0xFF00
	bra imprimir

sumar_iteracion:
	lda 0x80,pcr
	inca
	sta 0x80
	rts

sumar_anio:
	ldd aNo,pcr
	addd 0x80
	rts

comprobar_bisiesto:
	ldd aNo,pcr
	tfr b,a
	anda #1
	cmpa #0x00
	bne no_bisiesto
	tfr b,a
	lsra
	anda #1
	cmpa #0x00
	bne no_bisiesto
	lda dia,pcr
	ldb mes,pcr
	cmpa #0x1D	 		;COMPARA DIA CON 29
	bls	regresar 
	suba #0x1D
	addb #0x01
	sta dia,pcr
	stb mes,pcr
	rts
	
no_bisiesto:
	lda dia,pcr
	ldb mes,pcr
	suba #0x1C
	addb #0x01
	sta dia,pcr
	stb mes,pcr
	rts

sumar_mes:
	lda mes,pcr
	adda 0x80
	sta mes,pcr
	rts

comprobar_mes:
	lda mes,pcr
	suba #0xB
	bls regresar 
	ldb aNo,pcr
	addb #0x1
	sta mes,pcr
	stb aNo,pcr
	rts

suma_dia:
	lda dia,pcr
	adda 0x80
	sta dia,pcr

comprobar_dia:
	lda dia,pcr
	ldb mes,pcr
	cmpa #0x1C 		;COMPARA EL DIA CON 28
	bls regresar 
	cmpb #0x02
	beq comprobar_bisiesto
	cmpa #0x1E		;COMPARA EL DIA CON 30
	bls regresar 
	cmpb #0x04
	beq rest_30_sum_mes
	cmpb #0x06
	beq rest_30_sum_mes
	cmpb #0x09
	beq rest_30_sum_mes
	cmpb #0xB
	beq rest_30_sum_mes
	cmpa #0x1F		;COMPARA EL DIA COM 31
	bls regresar 
	suba #0x1F
	addb #0x01
	sta dia,pcr
	stb mes,pcr
	rts

rest_30_sum_mes:
	suba #0x1E
	addb #0x01
	sta dia,pcr
	stb mes,pcr
	rts
	
regresar:
  	rts
