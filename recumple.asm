
       .area PROG (ABS)

        .org 0x100
        .globl programa

        ;; definid en esta zona las variables que querAis usar,
        ;; como en estos ejemplos
aNo:    .word 0x1906 	; Año de nacimiento (BCD) 
mes:	.word 0x7 		; Mes de nacimiento (BCD) 
dia:	.word 0x27 		; Dia de nacimiento (BCD)
Ncumples:	.byte 10 	; Numero de Recumples a calcular
texto:  .ascii "---------------CALCULAR RECUMPLEANOS---------------"
        ;; fin de la zona de variables

        ;; comienzo del programa
programa:
		lds #0xF000 

presentar:
		ldx #texto
		
buclePresentar:
		lda ,x+
        beq acabar
        sta 0xFF00      ; salida por pantalla
        bra buclePresentar	

aNoValido:


NcumplesValido:


tipoaNo:


mes31:


mes30:


febrero:

        ;; aNadid estas lIneas para que el programa acabe y empiece
acabar: clra
        sta 0xFF01

        .org 0xFFFE     ; Vector de RESET
        .word programa

