ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Tue May 17 00:02:50 2022



                              1 	.module imprimir
                              2 
                              3 	.globl imprime 
                              4 	.globl dia
                              5 
   0000                       6 imprime:
                              7         ; segunda cifra.  En A quedan las dos Ultimas cifras
   0000 C6 00         [ 2]    8 		ldb #0
   0002 81 50         [ 2]    9         cmpa #80
   0004 25 03         [ 3]   10         blo Menor80
   0006 5C            [ 2]   11         incb
   0007 80 50         [ 2]   12         suba #80
   0009                      13 Menor80:
   0009 58            [ 2]   14 		lslb
   000A 81 28         [ 2]   15         cmpa #40
   000C 25 03         [ 3]   16         blo Menor40
   000E 5C            [ 2]   17         incb
   000F 80 28         [ 2]   18         suba #40
   0011                      19 Menor40:
   0011 58            [ 2]   20 		lslb
   0012 81 14         [ 2]   21         cmpa #20
   0014 25 03         [ 3]   22         blo Menor20
   0016 5C            [ 2]   23         incb
   0017 80 14         [ 2]   24         suba #20
   0019                      25 Menor20:
   0019 58            [ 2]   26 		lslb
   001A 81 0A         [ 2]   27         cmpa #10
   001C 25 03         [ 3]   28         blo Menor10
   001E 5C            [ 2]   29         incb
   001F 80 0A         [ 2]   30         suba #10
   0021                      31 Menor10:
   0021 CB 30         [ 2]   32 		addb #'0
   0023 F7 FF 00      [ 5]   33         stb 0xFF00
   0026 8B 30         [ 2]   34         adda #'0
   0028 B7 FF 00      [ 5]   35         sta 0xFF00
                             36 
   002B                      37 acabar:
   002B 39            [ 5]   38 	rts
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Tue May 17 00:02:50 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 Menor10            0021 R   |   0 Menor20            0019 R
  0 Menor40            0011 R   |   0 Menor80            0009 R
  0 acabar             002B R   |     dia                **** GX
  0 imprime            0000 GR

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Tue May 17 00:02:50 2022

Area Table

[_CSEG]
   0 _CODE            size   2C   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

