ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Mon May 16 22:35:25 2022



                              1 
                              2 
                              3 	.module calculo
                              4 
                              5 	.globl acabar
                              6 	.globl mostrarMes
                              7 	.globl comprobar_bisiesto
                              8 	.globl sumar_anio
                              9 	.globl sumar_mes
                             10 	.globl comprobar_mes
                             11 	.globl comprobar_dia
                             12 	.globl suma_dia
                             13 	.globl sumar_iteracion
                             14 	.globl sacar_pila
                             15 	.globl poner_pila
                             16 
                             17 	.globl Ncumples
                             18 	.globl aNo
                             19 	.globl dia
                             20 	.globl mes
                             21 
   0021 65 6E 65 72 6F 00    22 enero_str:      .asciz "enero"
   0027 66 65 62 72 65 72    23 febrero_str:    .asciz "febrero"
        6F 00
   002F 6D 61 72 7A 6F 00    24 marzo_str:      .asciz "marzo"
   0035 61 62 72 69 6C 00    25 abril_str:      .asciz "abril"
   003B 6D 61 79 6F 00       26 mayo_str:       .asciz "mayo"
   0040 6A 75 6E 69 6F 00    27 junio_str:      .asciz "junio"
   0046 6A 75 6C 69 6F 00    28 julio_str:      .asciz "julio"
   004C 61 67 6F 73 74 6F    29 agosto_str:     .asciz "agosto"
        00
   0053 73 65 70 74 69 65    30 septiembre_str: .asciz "septiembre"
        6D 62 72 65 00
   005E 6F 63 74 75 62 72    31 octubre_str:    .asciz "octubre"
        65 00
   0066 6E 6F 76 69 65 6D    32 noviembre_str:  .asciz "noviembre"
        62 72 65 00
   0070 64 69 63 69 65 6D    33 diciembre_str:  .asciz "diciembre"
        62 72 65 00
                             34 
   007A                      35 poner_pila:
   007A B6 02 54      [ 5]   36 	lda dia
   007D 36 02         [ 6]   37 	pshu a
   007F B6 02 52      [ 5]   38 	lda mes
   0082 36 02         [ 6]   39 	pshu a
   0084 B6 02 50      [ 5]   40 	lda aNo
   0087 36 02         [ 6]   41 	pshu a
   0089 39            [ 5]   42 	rts 
                             43 
   008A                      44 sacar_pila:
   008A 37 02         [ 6]   45 	pulu a
   008C B7 02 50      [ 5]   46 	sta aNo
   008F 37 02         [ 6]   47 	pulu a
   0091 B7 02 52      [ 5]   48 	sta mes
   0094 37 02         [ 6]   49 	pulu a
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Mon May 16 22:35:25 2022



   0096 B7 02 54      [ 5]   50 	sta dia
   0099 39            [ 5]   51 	rts
                             52 
   009A                      53 enero:
   009A 8E 00 21      [ 3]   54 	ldx #enero_str
   009D 20 65         [ 3]   55 	bra imprimir
                             56 
   009F                      57 febrero:
   009F 8E 00 27      [ 3]   58 	ldx #febrero_str
   00A2 20 60         [ 3]   59 	bra imprimir
                             60 
   00A4                      61 marzo:
   00A4 8E 00 2F      [ 3]   62 	ldx #marzo_str
   00A7 20 5B         [ 3]   63 	bra imprimir
                             64 
   00A9                      65 abril:
   00A9 8E 00 35      [ 3]   66 	ldx #abril_str
   00AC 20 56         [ 3]   67 	bra imprimir
                             68 
   00AE                      69 mayo:
   00AE 8E 00 3B      [ 3]   70 	ldx #mayo_str
   00B1 20 51         [ 3]   71 	bra imprimir
                             72 
   00B3                      73 junio:
   00B3 8E 00 40      [ 3]   74 	ldx #junio_str
   00B6 20 4C         [ 3]   75 	bra imprimir
                             76 
   00B8                      77 julio:
   00B8 8E 00 46      [ 3]   78 	ldx #julio_str
   00BB 20 47         [ 3]   79 	bra imprimir
                             80 
   00BD                      81 agosto:
   00BD 8E 00 4C      [ 3]   82 	ldx #agosto_str
   00C0 20 42         [ 3]   83 	bra imprimir
                             84 
   00C2                      85 septiembre:
   00C2 8E 00 53      [ 3]   86 	ldx #septiembre_str
   00C5 20 3D         [ 3]   87 	bra imprimir
                             88 
   00C7                      89 octubre:
   00C7 8E 00 5E      [ 3]   90 	ldx #octubre_str
   00CA 20 38         [ 3]   91 	bra imprimir
                             92 
   00CC                      93 noviembre:
   00CC 8E 00 66      [ 3]   94 	ldx #noviembre_str
   00CF 20 33         [ 3]   95 	bra imprimir
                             96 
   00D1                      97 diciembre:
   00D1 8E 00 70      [ 3]   98 	ldx #diciembre_str
   00D4 20 2E         [ 3]   99 	bra imprimir
                            100 
   00D6                     101 mostrarMes:
   00D6 C1 01         [ 2]  102 	cmpb #0x1
   00D8 27 C0         [ 3]  103 	beq enero
   00DA C1 02         [ 2]  104 	cmpb #0x2
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Mon May 16 22:35:25 2022



   00DC 27 C1         [ 3]  105 	beq febrero
   00DE C1 03         [ 2]  106 	cmpb #0x3
   00E0 27 C2         [ 3]  107 	beq marzo
   00E2 C1 04         [ 2]  108 	cmpb #0x4
   00E4 27 C3         [ 3]  109 	beq abril
   00E6 C1 05         [ 2]  110 	cmpb #0x5
   00E8 27 C4         [ 3]  111 	beq mayo
   00EA C1 06         [ 2]  112 	cmpb #0x6
   00EC 27 C5         [ 3]  113 	beq junio
   00EE C1 07         [ 2]  114 	cmpb #0x7
   00F0 27 C6         [ 3]  115 	beq julio
   00F2 C1 08         [ 2]  116 	cmpb #0x8
   00F4 27 C7         [ 3]  117 	beq agosto
   00F6 C1 09         [ 2]  118 	cmpb #0x9
   00F8 27 C8         [ 3]  119 	beq septiembre
   00FA C1 0A         [ 2]  120 	cmpb #0xA
   00FC 27 C9         [ 3]  121 	beq octubre
   00FE C1 0B         [ 2]  122 	cmpb #0xB
   0100 27 CA         [ 3]  123 	beq noviembre
   0102 20 CD         [ 3]  124 	bra diciembre
                            125 
   0104                     126 imprimir:
   0104 A6 80         [ 6]  127 	lda ,x+
   0106 10 27 00 B0   [ 6]  128 	lbeq regresar
   010A B7 FF 00      [ 5]  129 	sta 0xFF00
   010D 20 F5         [ 3]  130 	bra imprimir
                            131 
   010F                     132 sumar_iteracion:
   010F 96 80         [ 4]  133 	lda 0x80
   0111 4C            [ 2]  134 	inca
   0112 97 80         [ 4]  135 	sta 0x80
   0114 39            [ 5]  136 	rts
                            137 
   0115                     138 sumar_anio:
   0115 EC 8D 01 37   [10]  139 	ldd aNo,pcr
   0119 D3 80         [ 6]  140 	addd 0x80
   011B 39            [ 5]  141 	rts
                            142 
   011C                     143 comprobar_bisiesto:
   011C FC 02 50      [ 6]  144 	ldd aNo
   011F 1F 98         [ 6]  145 	tfr b,a
   0121 84 01         [ 2]  146 	anda #1
   0123 81 00         [ 2]  147 	cmpa #0x00
   0125 26 20         [ 3]  148 	bne no_bisiesto
   0127 1F 98         [ 6]  149 	tfr b,a
   0129 44            [ 2]  150 	lsra
   012A 84 01         [ 2]  151 	anda #1
   012C 81 00         [ 2]  152 	cmpa #0x00
   012E 26 17         [ 3]  153 	bne no_bisiesto
   0130 B6 02 54      [ 5]  154 	lda dia
   0133 F6 02 52      [ 5]  155 	ldb mes
   0136 81 1D         [ 2]  156 	cmpa #0x1D	 		;COMPARA DIA CON 29
   0138 10 23 00 7E   [ 6]  157 	lbls regresar 
   013C 80 1D         [ 2]  158 	suba #0x1D
   013E CB 01         [ 2]  159 	addb #0x01
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 4
Hexadecimal [16-Bits]                                 Mon May 16 22:35:25 2022



   0140 B7 02 54      [ 5]  160 	sta dia
   0143 F7 02 52      [ 5]  161 	stb mes
   0146 39            [ 5]  162 	rts
                            163 	
   0147                     164 no_bisiesto:
   0147 B6 02 54      [ 5]  165 	lda dia
   014A F6 02 52      [ 5]  166 	ldb mes
   014D 80 1C         [ 2]  167 	suba #0x1C
   014F CB 01         [ 2]  168 	addb #0x01
   0151 B7 02 54      [ 5]  169 	sta dia
   0154 F7 02 52      [ 5]  170 	stb mes
   0157 39            [ 5]  171 	rts
                            172 
   0158                     173 sumar_mes:
   0158 B6 02 52      [ 5]  174 	lda mes
   015B 9B 80         [ 4]  175 	adda 0x80
   015D B7 02 52      [ 5]  176 	sta mes
   0160 39            [ 5]  177 	rts
                            178 
   0161                     179 comprobar_mes:
   0161 B6 02 52      [ 5]  180 	lda mes
   0164 80 0B         [ 2]  181 	suba #0xB
   0166 23 52         [ 3]  182 	bls regresar 
   0168 F6 02 50      [ 5]  183 	ldb aNo
   016B CB 01         [ 2]  184 	addb #0x1
   016D B7 02 52      [ 5]  185 	sta mes
   0170 F7 02 50      [ 5]  186 	stb aNo
   0173 39            [ 5]  187 	rts
                            188 
   0174                     189 suma_dia:
   0174 B6 02 54      [ 5]  190 	lda dia
   0177 9B 80         [ 4]  191 	adda 0x80
   0179 B7 02 54      [ 5]  192 	sta dia
                            193 
   017C                     194 comprobar_dia:
   017C B6 02 54      [ 5]  195 	lda dia
   017F F6 02 52      [ 5]  196 	ldb mes
   0182 81 1C         [ 2]  197 	cmpa #0x1C 		;COMPARA EL DIA CON 28
   0184 23 34         [ 3]  198 	bls regresar 
   0186 C1 02         [ 2]  199 	cmpb #0x02
   0188 10 27 FF 90   [ 6]  200 	lbeq comprobar_bisiesto
   018C 81 1E         [ 2]  201 	cmpa #0x1E		;COMPARA EL DIA CON 30
   018E 23 2A         [ 3]  202 	bls regresar 
   0190 C1 04         [ 2]  203 	cmpb #0x04
   0192 27 1B         [ 3]  204 	beq rest_30_sum_mes
   0194 C1 06         [ 2]  205 	cmpb #0x06
   0196 27 17         [ 3]  206 	beq rest_30_sum_mes
   0198 C1 09         [ 2]  207 	cmpb #0x09
   019A 27 13         [ 3]  208 	beq rest_30_sum_mes
   019C C1 0B         [ 2]  209 	cmpb #0xB
   019E 27 0F         [ 3]  210 	beq rest_30_sum_mes
   01A0 81 1F         [ 2]  211 	cmpa #0x1F		;COMPARA EL DIA COM 31
   01A2 23 16         [ 3]  212 	bls regresar 
   01A4 80 1F         [ 2]  213 	suba #0x1F
   01A6 CB 01         [ 2]  214 	addb #0x01
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 5
Hexadecimal [16-Bits]                                 Mon May 16 22:35:25 2022



   01A8 B7 02 54      [ 5]  215 	sta dia
   01AB F7 02 52      [ 5]  216 	stb mes
   01AE 39            [ 5]  217 	rts
                            218 
   01AF                     219 rest_30_sum_mes:
   01AF 80 1E         [ 2]  220 	suba #0x1E
   01B1 CB 01         [ 2]  221 	addb #0x01
   01B3 B7 02 54      [ 5]  222 	sta dia
   01B6 F7 02 52      [ 5]  223 	stb mes
   01B9 39            [ 5]  224 	rts
                            225 	
   01BA                     226 regresar:
   01BA 39            [ 5]  227   	rts
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 6
Hexadecimal [16-Bits]                                 Mon May 16 22:35:25 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
    Ncumples           **** GX  |     aNo                **** GX
  0 abril              0088 R   |   0 abril_str          0014 R
    acabar             **** GX  |   0 agosto             009C R
  0 agosto_str         002B R   |   0 comprobar_bisi     00FB GR
  0 comprobar_dia      015B GR  |   0 comprobar_mes      0140 GR
    dia                **** GX  |   0 diciembre          00B0 R
  0 diciembre_str      004F R   |   0 enero              0079 R
  0 enero_str          0000 R   |   0 febrero            007E R
  0 febrero_str        0006 R   |   0 imprimir           00E3 R
  0 julio              0097 R   |   0 julio_str          0025 R
  0 junio              0092 R   |   0 junio_str          001F R
  0 marzo              0083 R   |   0 marzo_str          000E R
  0 mayo               008D R   |   0 mayo_str           001A R
    mes                **** GX  |   0 mostrarMes         00B5 GR
  0 no_bisiesto        0126 R   |   0 noviembre          00AB R
  0 noviembre_str      0045 R   |   0 octubre            00A6 R
  0 octubre_str        003D R   |   0 poner_pila         0059 GR
  0 regresar           0199 R   |   0 rest_30_sum_me     018E R
  0 sacar_pila         0069 GR  |   0 septiembre         00A1 R
  0 septiembre_str     0032 R   |   0 suma_dia           0153 GR
  0 sumar_anio         00F4 GR  |   0 sumar_iteracio     00EE GR
  0 sumar_mes          0137 GR

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 7
Hexadecimal [16-Bits]                                 Mon May 16 22:35:25 2022

Area Table

[_CSEG]
   0 _CODE            size  19A   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

