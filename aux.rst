ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Tue May 17 14:18:45 2022



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
   0207                      20 daa:
   0207 34 03         [ 7]   21   pshs a,cc
   0209 A6 E4         [ 4]   22   lda ,s             ; A=CC
   020B 6F E2         [ 8]   23   clr ,-s            ; S-> 00 CC A
   020D 84 20         [ 2]   24   anda #0x20         ; bit H de CC
   020F 26 08         [ 3]   25   bne daa_ajusteBajo ; si H=1, hay que ajustar la cifra baja
   0211 A6 62         [ 5]   26   lda 2,s            ; si H=0 y la cifra baja>9, ajustarla
   0213 84 0F         [ 2]   27   anda #0xF
   0215 81 0A         [ 2]   28   cmpa #0xA
   0217 25 04         [ 3]   29   blo daa_sinAjusteBajo
                             30 
   0219                      31 daa_ajusteBajo:
   0219 86 06         [ 2]   32   lda #6
   021B A7 E4         [ 4]   33   sta ,s
                             34 
   021D                      35 daa_sinAjusteBajo:
   021D 86 01         [ 2]   36   lda #1
   021F A4 61         [ 5]   37   anda 1,s
   0221 26 06         [ 3]   38   bne daa_ajusteAlto    ; si flag C=1, hay que ajustar la alta
   0223 A6 62         [ 5]   39   lda 2,s               ; o si C=0 y resultado>0x9A
   0225 81 9A         [ 2]   40   cmpa #0x9A
   0227 25 06         [ 3]   41   blo daa_sinAjusteAlto
                             42 
   0229                      43 daa_ajusteAlto:
   0229 A6 E4         [ 4]   44   lda ,s
   022B 8A 60         [ 2]   45   ora #0x60
   022D A7 E4         [ 4]   46   sta ,s
                             47 
   022F                      48 daa_sinAjusteAlto:
   022F A6 E0         [ 6]   49   lda  ,s+   ; aNadimos el ajuste a A
   0231 AB 61         [ 5]   50   adda 1,s
   0233 A7 61         [ 5]   51   sta  1,s
   0235 1F A8         [ 6]   52   tfr cc,a   ; el flag C es el or del C original y el de la suma
   0237 AA E4         [ 4]   53   ora ,s
   0239 A7 E4         [ 4]   54   sta ,s
   023B 35 03         [ 7]   55   puls cc,a 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Tue May 17 14:18:45 2022



   023D 4D            [ 2]   56   tsta       ; ajustamos los flags Z y N del resultado
   023E 39            [ 5]   57   rts
                             58 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Tue May 17 14:18:45 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 daa                0000 GR  |   0 daa_ajusteAlto     0022 R
  0 daa_ajusteBajo     0012 R   |   0 daa_sinAjusteA     0028 R
  0 daa_sinAjusteB     0016 R

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 4
Hexadecimal [16-Bits]                                 Tue May 17 14:18:45 2022

Area Table

[_CSEG]
   0 _CODE            size   38   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

