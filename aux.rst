ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Mon May 16 22:27:17 2022



                              1 
                              2   ; +----------------------------------------------+
                              3   ; |           Subrutinas Auxiliares              |
                              4   ; +----------------------------------------------+
                              5 
                              6   .module aux
                              7   
                              8   .globl daa
                              9 
                             10   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             11   ; daa                                                              ;
                             12   ;     simula la instrucciOn daa del ensamblador                    ;
                             13   ;     se debe usar detAs de la instrucciOn adda para sumas BCD     ;
                             14   ;                                                                  ;
                             15   ;   Entrada: A-resultado de la suma    CC-flags de la suma         ;
                             16   ;   Salida:  A-resultado ajustado BCD  CC-flags ajustados BCD      ;
                             17   ;   Registros afectados: ninguno                                   ;
                             18   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             19 
   01BB                      20 daa:
   01BB 34 03         [ 7]   21   pshs a,cc
   01BD A6 E4         [ 4]   22   lda ,s             ; A=CC
   01BF 6F E2         [ 8]   23   clr ,-s            ; S-> 00 CC A
   01C1 84 20         [ 2]   24   anda #0x20         ; bit H de CC
   01C3 26 08         [ 3]   25   bne daa_ajusteBajo ; si H=1, hay que ajustar la cifra baja
   01C5 A6 62         [ 5]   26   lda 2,s            ; si H=0 y la cifra baja>9, ajustarla
   01C7 84 0F         [ 2]   27   anda #0xF
   01C9 81 0A         [ 2]   28   cmpa #0xA
   01CB 25 04         [ 3]   29   blo daa_sinAjusteBajo
                             30 
   01CD                      31 daa_ajusteBajo:
   01CD 86 06         [ 2]   32   lda #6
   01CF A7 E4         [ 4]   33   sta ,s
                             34 
   01D1                      35 daa_sinAjusteBajo:
   01D1 86 01         [ 2]   36   lda #1
   01D3 A4 61         [ 5]   37   anda 1,s
   01D5 26 06         [ 3]   38   bne daa_ajusteAlto    ; si flag C=1, hay que ajustar la alta
   01D7 A6 62         [ 5]   39   lda 2,s               ; o si C=0 y resultado>0x9A
   01D9 81 9A         [ 2]   40   cmpa #0x9A
   01DB 25 06         [ 3]   41   blo daa_sinAjusteAlto
                             42 
   01DD                      43 daa_ajusteAlto:
   01DD A6 E4         [ 4]   44   lda ,s
   01DF 8A 60         [ 2]   45   ora #0x60
   01E1 A7 E4         [ 4]   46   sta ,s
                             47 
   01E3                      48 daa_sinAjusteAlto:
   01E3 A6 E0         [ 6]   49   lda  ,s+   ; aNadimos el ajuste a A
   01E5 AB 61         [ 5]   50   adda 1,s
   01E7 A7 61         [ 5]   51   sta  1,s
   01E9 1F A8         [ 6]   52   tfr cc,a   ; el flag C es el or del C original y el de la suma
   01EB AA E4         [ 4]   53   ora ,s
   01ED A7 E4         [ 4]   54   sta ,s
   01EF 35 03         [ 7]   55   puls cc,a 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Mon May 16 22:27:17 2022



   01F1 4D            [ 2]   56   tsta       ; ajustamos los flags Z y N del resultado
   01F2 39            [ 5]   57   rts
                             58 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Mon May 16 22:27:17 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 daa                0000 GR  |   0 daa_ajusteAlto     0022 R
  0 daa_ajusteBajo     0012 R   |   0 daa_sinAjusteA     0028 R
  0 daa_sinAjusteB     0016 R

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 4
Hexadecimal [16-Bits]                                 Mon May 16 22:27:17 2022

Area Table

[_CSEG]
   0 _CODE            size   38   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

