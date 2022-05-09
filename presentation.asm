
  ; +------------------------------------------+
  ; |               Presentacion               |
  ; +------------------------------------------+

  .module presentation

  .globl presentation_str
  .globl presentation
  .globl presentation

presentation_str:
  .ascii "+-----------------------------------------+\n"
  .ascii "|         Calculadora de Recumples        |\n"
  .ascii "+-----------------------------------------+\n"
  .ascii "\n\n"
  .byte 10
  .byte 0

print:
  lda ,x+
  beq finish
  sta 0xFF00
  bra print

presentation:
  ldx #presentation_str
  bra print

finish:
  rts
