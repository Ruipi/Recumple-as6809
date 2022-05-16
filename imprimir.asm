	.area PROG (ABS)

        ; definimos una constante
fin     .equ 0xFF01
pantalla .equ 0xFF00

	.org 0x100

	.globl programa
programa:
	lda #30 ; un nUmero como cualquier otro, para probar

Menor40:
	lslb
    cmpa #20
    blo Menor20
    incb
    suba #20
Menor20:
	lslb
    cmpa #10
    blo Menor10
    incb
    suba #10
Menor10:
	addb #'0
    stb pantalla
    adda #'0
    sta pantalla

    ; imprimimos un salto de lInea
    ldb #'\n
    stb pantalla

    ; el programa acaba
    clra

acabar:
	sta fin

	.org 0xFFFE	; vector de RESET
	.word programa
