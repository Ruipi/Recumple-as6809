ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Mon May 16 22:27:17 2022



                              1 	.module imprimir
                              2 
                              3 	.globl imprime 
                              4 
   0000                       5 imprime:
                              6 
   0000                       7 Menor40:
   0000 58            [ 2]    8 	lslb
   0001 81 14         [ 2]    9     cmpa #20
   0003 25 03         [ 3]   10     blo Menor20
   0005 5C            [ 2]   11     incb
   0006 80 14         [ 2]   12     suba #20
   0008                      13 Menor20:
   0008 58            [ 2]   14 	lslb
   0009 81 0A         [ 2]   15     cmpa #10
   000B 25 03         [ 3]   16     blo Menor10
   000D 5C            [ 2]   17     incb
   000E 80 0A         [ 2]   18     suba #10
   0010                      19 Menor10:
   0010 CB 30         [ 2]   20 	addb #'0
   0012 F7 FF 00      [ 5]   21     stb 0xFF00 
   0015 8B 30         [ 2]   22     adda #'0
   0017 B7 FF 00      [ 5]   23     sta 0xFF00
                             24 
                             25     ; imprimimos un salto de lInea
   001A C6 0A         [ 2]   26     ldb #'\n
   001C F7 FF 00      [ 5]   27     stb 0xFF00
                             28 
                             29     ; el programa acaba
   001F 4F            [ 2]   30     clra
                             31 
   0020                      32 acabar:
   0020 39            [ 5]   33 	rts
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Mon May 16 22:27:17 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 Menor10            0010 R   |   0 Menor20            0008 R
  0 Menor40            0000 R   |   0 acabar             0020 R
  0 imprime            0000 GR

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Mon May 16 22:27:17 2022

Area Table

[_CSEG]
   0 _CODE            size   21   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

