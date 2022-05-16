	.module imprimir

	.globl imprime 

imprime:

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
    stb 0xFF00 
    adda #'0
    sta 0xFF00

    ; imprimimos un salto de lInea
    ldb #'\n
    stb 0xFF00

    ; el programa acaba
    clra

acabar:
	rts
