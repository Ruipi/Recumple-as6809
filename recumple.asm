
  ; +-------------------------------------+
  ; |      Calculadora de Recumples       |
  ; +-------------------------------------+
  ; |                                     |
  ; |                                     |
  ; +-------------------------------------+

  .module recumple

  .area PROG (ABS)

  .org 0x100
  .globl presentation
  .globl condicion_Ncumples
  .globl daa
  .globl acabar

aNo:    .word 0x1906 	        ; Año de nacimiento (BCD) 
mes:	.word 0x7 		; Mes de nacimiento (BCD) 
dia:	.word 0x27 		; Dia de nacimiento (BCD)
Ncumples:	.byte 0x10 	; Numero de Recumples a calcular

programa:
  lds #0xF000 
  jsr presentation	

condiciones:
  lda Ncumples
  jsr condicion_Ncumples

mes31:

mes30:

febrero:

acabar: 
  clra
  sta 0xFF01

  .org 0xFFFE
  .word programa

