
  ; +----------------------------------------------+
  ; |           Subrutinas Auxiliares              |
  ; +----------------------------------------------+

  .module aux
  
  .globl daa

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; daa                                                              ;
  ;     simula la instrucciOn daa del ensamblador                    ;
  ;     se debe usar detAs de la instrucciOn adda para sumas BCD     ;
  ;                                                                  ;
  ;   Entrada: A-resultado de la suma    CC-flags de la suma         ;
  ;   Salida:  A-resultado ajustado BCD  CC-flags ajustados BCD      ;
  ;   Registros afectados: ninguno                                   ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

daa:
  pshs a,cc
  lda ,s             ; A=CC
  clr ,-s            ; S-> 00 CC A
  anda #0x20         ; bit H de CC
  bne daa_ajusteBajo ; si H=1, hay que ajustar la cifra baja
  lda 2,s            ; si H=0 y la cifra baja>9, ajustarla
  anda #0xF
  cmpa #0xA
  blo daa_sinAjusteBajo

daa_ajusteBajo:
  lda #6
  sta ,s

daa_sinAjusteBajo:
  lda #1
  anda 1,s
  bne daa_ajusteAlto    ; si flag C=1, hay que ajustar la alta
  lda 2,s               ; o si C=0 y resultado>0x9A
  cmpa #0x9A
  blo daa_sinAjusteAlto

daa_ajusteAlto:
  lda ,s
  ora #0x60
  sta ,s

daa_sinAjusteAlto:
  lda  ,s+   ; aNadimos el ajuste a A
  adda 1,s
  sta  1,s
  tfr cc,a   ; el flag C es el or del C original y el de la suma
  ora ,s
  sta ,s
  puls cc,a 
  tsta       ; ajustamos los flags Z y N del resultado
  rts

