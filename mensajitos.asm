
  .module mensajitos
  
  .area PROG (ABS)

  .org 0x100

dia:            .word 0x3
mes:            .word 0x2
Ncumples:       .byte 0xA

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

program:
  lda #0x1
  sta 0x80
  
calculo:
  cmpa Ncumples
  bgt finish
  ldb #48
  stb 0xFF00
  adda #48
  sta 0xFF00
  lda #58
  sta 0xFF00
  lda #32
  sta 0xFF00
  ldd dia
  addb #48
  addb 0x80
  stb 0xFF00
  lda #32
  sta 0xFF00
  lda #100
  sta 0xFF00
  lda #101
  sta 0xFF00
  ldd mes
  addb 0x80
  jsr mostrarMes
  lda #100
  sta 0xFF00
  lda #101
  sta 0xFF00
  lda #32
  sta 0xFF00
  lda #49
  sta 0xFF00
  lda #57
  sta 0xFF00
  lda #54 
  sta 0xFF00
  lda #57
  sta 0xFF00
  lda #10
  sta 0xFF00
  lda 0x80
  inca
  sta 0x80
  bra calculo

finish:
  clra
  sta 0xFF01

  .org 0xFFFE
  .word program

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

print:
  lda ,x+
  beq regresar
  sta 0xFF00
  bra print

regresar:
  rts

enero:
  ldx #enero_str
  bra print

febrero:
  ldx #febrero_str
  bra print

marzo:
  ldx #marzo_str
  bra print
  
abril:
  ldx #abril_str
  bra print
  
mayo:
  ldx #mayo_str
  bra print

junio:
  ldx #junio_str
  bra print
  
julio:
  ldx #julio_str
  bra print

agosto:
  ldx #agosto_str
  bra print
  
septiembre:
  ldx #septiembre_str
  bra print
  
octubre:
  ldx #octubre_str
  bra print
  
noviembre:
  ldx #noviembre_str
  bra print
  
diciembre:
  ldx #diciembre_str
  bra print
