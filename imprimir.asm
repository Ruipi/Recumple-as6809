	.module imprimir

	.globl imprime 
	.globl dia

imprime:
        ; segunda cifra.  En A quedan las dos Ultimas cifras
		ldb #0
        cmpa #80
        blo Menor80
        incb
        suba #80
Menor80:
		lslb
        cmpa #40
        blo Menor40
        incb
        suba #40
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

acabar:
	rts
