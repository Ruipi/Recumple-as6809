    .module recumple

    .area PROG (ABS)

    .org 0x100
	.globl programa

aNo:            .word 0x1990 	; Año de nacimiento (BCD) 
mes:	    	.word 0x8	; Mes de nacimiento (BCD) 
dia:	        .word 0x29 	; Dia de nacimiento (BCD)
Ncumples:     	.byte 20	; Numero de Recumples a calcular
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


programa:
	lda dia+1,pcr
    sta dia,pcr
	lda mes+1,pcr
	sta mes,pcr
	lds #0xF000
	ldu #0xF100
	lda #0x0
	sta 0x80
	lda #0
	sta 0x81
	bra poner_pila
	
sacar_pila:
	pulu a
	pulu b
	std aNo,pcr
	pulu a
	sta mes,pcr
	pulu a

poner_pila:
	lda dia,pcr
	pshu a
	lda mes,pcr
	pshu a
	ldd aNo,pcr
	pshu b
	pshu a
	sta dia,pcr

bucle_n_cumple:
	bsr sumar_anio
	bsr sumar_mes
	lbsr comprobar_mes
	bsr suma_dia
	lbsr comprobar_dia
	lbsr comprobar_mes
	lbsr presentar

compara_iter:
	bsr sumar_iteracion
	lda 0x81
	cmpa Ncumples
	bls sacar_pila 
	lbra acabar
	
sumar_iteracion:
	lda 0x80
	adda #0x01 
	lbsr daa
	sta 0x80
	lda 0x81
	inca
	sta 0x81
	rts

sumar_mes:
	lda mes,pcr
	adda 0x80
	lbsr daa
	sta mes,pcr
	rts

suma_dia:
	lda dia,pcr
	adda 0x80
	lbsr daa
	sta dia,pcr
	rts

sumar_anio:
	ldd aNo,pcr
	exg a,b
	adda 0x80
	lbsr daa
	cmpa #0
	beq cambiar_siglo 
	exg a,b
	std aNo,pcr
	rts

cambiar_siglo:
	pulu b
	ldb #0x20
	pshu b
	exg a,b
	std aNo,pcr
	rts

comprobar_mes:
	lda mes,pcr
	cmpa #0x12
	lbls regresar 
	adda #0x08
	lbsr daa
	suba #0x20
	sta mes,pcr
	ldd aNo,pcr
	exg a,b
	adda #0x1
	lbsr daa
	cmpa #0
	beq cambiar_siglo
	exg a,b
	std aNo,pcr
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
	cmpa #0x29	 
	lbls regresar 
	adda #0x01	
	lbsr daa
	suba #0x30
	sta dia,pcr
	lda mes,pcr
	adda #0x01
	lbsr daa
	sta mes,pcr
	rts
	
no_bisiesto:
	lda dia,pcr
	adda #0x02
	lbsr daa
	suba #0x30
	sta dia,pcr
	lda mes,pcr	
	adda #0x01
	lbsr daa
	sta mes,pcr
	rts


comprobar_dia:
	lda dia,pcr
	ldb mes,pcr
	cmpa #0x28		;COMPARA EL DIA CON 28
	bls regresar 
	cmpb #0x02
	lbeq comprobar_bisiesto
	cmpa #0x30		;COMPARA EL DIA CON 30
	bls regresar 
	cmpb #0x04
	beq rest_30_sum_mes
	cmpb #0x06
	beq rest_30_sum_mes
	cmpb #0x09
	beq rest_30_sum_mes
	cmpb #0x11
	beq rest_30_sum_mes
	cmpa #0x31		;COMPARA EL DIA COM 31
	bls regresar 
	adda #0x09
	bsr daa
	suba #0x40
	sta dia,pcr
	lda mes,pcr
	adda #0x01
	bsr daa
	sta mes,pcr
	rts

rest_30_sum_mes:
	lda dia,pcr
	suba #0x30
	sta dia,pcr
	lda mes,pcr
	adda #0x01
	bsr daa
	sta mes,pcr
	rts

regresar:
  	rts

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; daa                                                              ;
  ;     simula la instrucciOn daa del ensamblador                    ;
  ;     se debe usar detAs de la instrucciOn adda para sumas BCD     ;
  ;                                                                  ;
  ;   Entrada: A-resultado de la suma    CC-flags de la suma         ;
  ;   Salida:  A-resultado ajustado BCD  CC-flags ajustados BCD      ;
  ;   Registros afectados: ninguno                                   ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

daa:
  pshs a,cc
  lda ,s             ; A=CC
  clr ,-s            ; S-> 00 CC A
  anda #0x20         ; bit H de CC
  bne daa_ajusteBajo ; si H=1, hay que ajustar la cifra baja
  lda 2,s            ; si H=0 y la cifra baja>9, ajustarla
  anda #0xF
  cmpa #0xA
  blo daa_sinAjusteBajo

daa_ajusteBajo:
  lda #6
  sta ,s

daa_sinAjusteBajo:
  lda #1
  anda 1,s
  bne daa_ajusteAlto    ; si flag C=1, hay que ajustar la alta
  lda 2,s               ; o si C=0 y resultado>0x9A
  cmpa #0x9A
  blo daa_sinAjusteAlto

daa_ajusteAlto:
  lda ,s
  ora #0x60
  sta ,s

daa_sinAjusteAlto:
  lda  ,s+   ; aNadimos el ajuste a A
  adda 1,s
  sta  1,s
  tfr cc,a   ; el flag C es el or del C original y el de la suma
  ora ,s
  sta ,s
  puls cc,a 
  tsta       ; ajustamos los flags Z y N del resultado
  rts



;;;;;;;;;;;;;;;;;;;;;;;;;;IMPRIME;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	cmpb #0x10
	beq octubre
	cmpb #0x11
	beq noviembre
	bra diciembre

imprimir:
	lda ,x+
	lbeq regresar
	sta 0xFF00
	bra imprimir


imprime:
		ldb #0
        cmpa #0x80
        blo Menor80
        incb
        suba #0x80
Menor80:
		lslb
        cmpa #0x40
        blo Menor40
        incb
        suba #0x40
Menor40:
		lslb
        cmpa #0x20
        blo Menor20
        incb
        suba #0x20
Menor20:
		lslb
        cmpa #0x10
        blo Menor10
        incb
        suba #0x10
Menor10:
		addb #'0
        adda #'0

imprime_cifra_b:
        stb 0xFF00 

imprime_cifra_a:
        sta 0xFF00 
		rts
	

	
acabar: 
	clra
	sta 0xFF01

	.org 0xFFFE
	.word programa

