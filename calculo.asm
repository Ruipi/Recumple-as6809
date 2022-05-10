
  ; +-----------------------------------------+
  ; |       Subrutinas para el calculo        |
  ; +-----------------------------------------+

  .module calculo

  .globl acabar
  .globl condicion_Ncumples

condicion_Ncumples:
  cmpa #0x01
  blt acabar
  cmpa #0x30
  bgt acabar
  rts
