
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
  .globl acabar
  .globl condicion_Ncumples
  .globl condicion_aNo
  .globl comprobar_bisiesto
  .globl daa

aNo:    .word 0x1976 	        ; Año de nacimiento (BCD) 
mes:	.word 0x7 		; Mes de nacimiento (BCD) 
dia:	.word 0x27 		; Dia de nacimiento (BCD)
Ncumples:	.byte 0x10 	; Numero de Recumples a calcular

  .globl Ncumples
  .globl aNo

programa:
  lds #0xF000
  jsr presentation	

condiciones:
  jsr condicion_Ncumples
  jsr condicion_aNo

mes31:
  
mes30:

febrero:

acabar: 
  clra
  sta 0xFF01

  .org 0xFFFE
  .word programa

