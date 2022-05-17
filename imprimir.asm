	.module imprimir

	.globl imprime 
	.globl dia

imprime:
        ; segunda cifra.  En A quedan las dos Ultimas cifras
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

acabar:
		rts
