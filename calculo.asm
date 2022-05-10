
  ; +-----------------------------------------+
  ; |       Subrutinas para el calculo        |
  ; +-----------------------------------------+

  .module calculo

  .globl acabar
  .globl condicion_Ncumples
  .globl condicion_aNo

  .globl Ncumples
  .globl aNo

condicion_Ncumples:
  lda Ncumples
  cmpa #0x01
  blt acabar
  cmpa #0x30
  bgt acabar
  rts

condicion_aNo:
  ldd aNo
  cmpd #0x1920
  blt acabar
  cmpd #0x2050
  bgt acabar
  rts
