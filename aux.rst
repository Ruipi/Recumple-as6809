ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Mon May 16 23:51:52 2022



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
   0206                      20 daa:
   0206 34 03         [ 7]   21   pshs a,cc
   0208 A6 E4         [ 4]   22   lda ,s             ; A=CC
   020A 6F E2         [ 8]   23   clr ,-s            ; S-> 00 CC A
   020C 84 20         [ 2]   24   anda #0x20         ; bit H de CC
   020E 26 08         [ 3]   25   bne daa_ajusteBajo ; si H=1, hay que ajustar la cifra baja
   0210 A6 62         [ 5]   26   lda 2,s            ; si H=0 y la cifra baja>9, ajustarla
   0212 84 0F         [ 2]   27   anda #0xF
   0214 81 0A         [ 2]   28   cmpa #0xA
   0216 25 04         [ 3]   29   blo daa_sinAjusteBajo
                             30 
   0218                      31 daa_ajusteBajo:
   0218 86 06         [ 2]   32   lda #6
   021A A7 E4         [ 4]   33   sta ,s
                             34 
   021C                      35 daa_sinAjusteBajo:
   021C 86 01         [ 2]   36   lda #1
   021E A4 61         [ 5]   37   anda 1,s
   0220 26 06         [ 3]   38   bne daa_ajusteAlto    ; si flag C=1, hay que ajustar la alta
   0222 A6 62         [ 5]   39   lda 2,s               ; o si C=0 y resultado>0x9A
   0224 81 9A         [ 2]   40   cmpa #0x9A
   0226 25 06         [ 3]   41   blo daa_sinAjusteAlto
                             42 
   0228                      43 daa_ajusteAlto:
   0228 A6 E4         [ 4]   44   lda ,s
   022A 8A 60         [ 2]   45   ora #0x60
   022C A7 E4         [ 4]   46   sta ,s
                             47 
   022E                      48 daa_sinAjusteAlto:
   022E A6 E0         [ 6]   49   lda  ,s+   ; aNadimos el ajuste a A
   0230 AB 61         [ 5]   50   adda 1,s
   0232 A7 61         [ 5]   51   sta  1,s
   0234 1F A8         [ 6]   52   tfr cc,a   ; el flag C es el or del C original y el de la suma
   0236 AA E4         [ 4]   53   ora ,s
   0238 A7 E4         [ 4]   54   sta ,s
   023A 35 03         [ 7]   55   puls cc,a 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Mon May 16 23:51:52 2022



   023C 4D            [ 2]   56   tsta       ; ajustamos los flags Z y N del resultado
   023D 39            [ 5]   57   rts
                             58 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Mon May 16 23:51:52 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 daa                0000 GR  |   0 daa_ajusteAlto     0022 R
  0 daa_ajusteBajo     0012 R   |   0 daa_sinAjusteA     0028 R
  0 daa_sinAjusteB     0016 R

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 4
Hexadecimal [16-Bits]                                 Mon May 16 23:51:52 2022

Area Table

[_CSEG]
   0 _CODE            size   38   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

