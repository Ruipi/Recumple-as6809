ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Tue May 17 01:56:51 2022



                              1 	.module calculo
                              2 
                              3 	.globl acabar
                              4 	.globl mostrarMes
                              5 	.globl comprobar_bisiesto
                              6 	.globl sumar_anio
                              7 	.globl sumar_mes
                              8 	.globl comprobar_mes
                              9 	.globl comprobar_dia
                             10 	.globl suma_dia
                             11 	.globl sumar_iteracion
                             12 	.globl sacar_pila
                             13 	.globl poner_pila
                             14 	.globl daa
                             15 
                             16 	.globl Ncumples
                             17 	.globl aNo
                             18 	.globl dia
                             19 	.globl mes
                             20 
   002C 20 65 6E 65 72 6F    21 enero_str:      .asciz " enero "
        20 00
   0034 20 66 65 62 72 65    22 febrero_str:    .asciz " febrero "
        72 6F 20 00
   003E 20 6D 61 72 7A 6F    23 marzo_str:      .asciz " marzo "
        20 00
   0046 20 61 62 72 69 6C    24 abril_str:      .asciz " abril "
        20 00
   004E 20 6D 61 79 6F 20    25 mayo_str:       .asciz " mayo "
        00
   0055 20 6A 75 6E 69 6F    26 junio_str:      .asciz " junio "
        20 00
   005D 20 6A 75 6C 69 6F    27 julio_str:      .asciz " julio "
        20 00
   0065 20 61 67 6F 73 74    28 agosto_str:     .asciz " agosto "
        6F 20 00
   006E 20 73 65 70 74 69    29 septiembre_str: .asciz " septiembre "
        65 6D 62 72 65 20
        00
   007B 20 6F 63 74 75 62    30 octubre_str:    .asciz " octubre "
        72 65 20 00
   0085 20 6E 6F 76 69 65    31 noviembre_str:  .asciz " noviembre "
        6D 62 72 65 20 00
   0091 20 64 69 63 69 65    32 diciembre_str:  .asciz " diciembre "
        6D 62 72 65 20 00
                             33 
   009D                      34 poner_pila:
   009D B6 02 54      [ 5]   35 	lda dia
   00A0 36 02         [ 6]   36 	pshu a
   00A2 B6 02 52      [ 5]   37 	lda mes
   00A5 36 02         [ 6]   38 	pshu a
   00A7 FC 02 50      [ 6]   39 	ldd aNo
   00AA 36 04         [ 6]   40 	pshu b
   00AC 36 02         [ 6]   41 	pshu a
   00AE 39            [ 5]   42 	rts 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Tue May 17 01:56:51 2022



                             43 
   00AF                      44 sacar_pila:
   00AF 37 02         [ 6]   45 	pulu a
   00B1 37 04         [ 6]   46 	pulu b
   00B3 FD 02 50      [ 6]   47 	std aNo
   00B6 37 02         [ 6]   48 	pulu a
   00B8 B7 02 52      [ 5]   49 	sta mes
   00BB 37 02         [ 6]   50 	pulu a
   00BD B7 02 54      [ 5]   51 	sta dia
   00C0 39            [ 5]   52 	rts
                             53 
   00C1                      54 enero:
   00C1 8E 00 2C      [ 3]   55 	ldx #enero_str
   00C4 20 65         [ 3]   56 	bra imprimir
                             57 
   00C6                      58 febrero:
   00C6 8E 00 34      [ 3]   59 	ldx #febrero_str
   00C9 20 60         [ 3]   60 	bra imprimir
                             61 
   00CB                      62 marzo:
   00CB 8E 00 3E      [ 3]   63 	ldx #marzo_str
   00CE 20 5B         [ 3]   64 	bra imprimir
                             65 
   00D0                      66 abril:
   00D0 8E 00 46      [ 3]   67 	ldx #abril_str
   00D3 20 56         [ 3]   68 	bra imprimir
                             69 
   00D5                      70 mayo:
   00D5 8E 00 4E      [ 3]   71 	ldx #mayo_str
   00D8 20 51         [ 3]   72 	bra imprimir
                             73 
   00DA                      74 junio:
   00DA 8E 00 55      [ 3]   75 	ldx #junio_str
   00DD 20 4C         [ 3]   76 	bra imprimir
                             77 
   00DF                      78 julio:
   00DF 8E 00 5D      [ 3]   79 	ldx #julio_str
   00E2 20 47         [ 3]   80 	bra imprimir
                             81 
   00E4                      82 agosto:
   00E4 8E 00 65      [ 3]   83 	ldx #agosto_str
   00E7 20 42         [ 3]   84 	bra imprimir
                             85 
   00E9                      86 septiembre:
   00E9 8E 00 6E      [ 3]   87 	ldx #septiembre_str
   00EC 20 3D         [ 3]   88 	bra imprimir
                             89 
   00EE                      90 octubre:
   00EE 8E 00 7B      [ 3]   91 	ldx #octubre_str
   00F1 20 38         [ 3]   92 	bra imprimir
                             93 
   00F3                      94 noviembre:
   00F3 8E 00 85      [ 3]   95 	ldx #noviembre_str
   00F6 20 33         [ 3]   96 	bra imprimir
                             97 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Tue May 17 01:56:51 2022



   00F8                      98 diciembre:
   00F8 8E 00 91      [ 3]   99 	ldx #diciembre_str
   00FB 20 2E         [ 3]  100 	bra imprimir
                            101 
   00FD                     102 mostrarMes:
   00FD C1 01         [ 2]  103 	cmpb #0x1
   00FF 27 C0         [ 3]  104 	beq enero
   0101 C1 02         [ 2]  105 	cmpb #0x2
   0103 27 C1         [ 3]  106 	beq febrero
   0105 C1 03         [ 2]  107 	cmpb #0x3
   0107 27 C2         [ 3]  108 	beq marzo
   0109 C1 04         [ 2]  109 	cmpb #0x4
   010B 27 C3         [ 3]  110 	beq abril
   010D C1 05         [ 2]  111 	cmpb #0x5
   010F 27 C4         [ 3]  112 	beq mayo
   0111 C1 06         [ 2]  113 	cmpb #0x6
   0113 27 C5         [ 3]  114 	beq junio
   0115 C1 07         [ 2]  115 	cmpb #0x7
   0117 27 C6         [ 3]  116 	beq julio
   0119 C1 08         [ 2]  117 	cmpb #0x8
   011B 27 C7         [ 3]  118 	beq agosto
   011D C1 09         [ 2]  119 	cmpb #0x9
   011F 27 C8         [ 3]  120 	beq septiembre
   0121 C1 0A         [ 2]  121 	cmpb #0xA
   0123 27 C9         [ 3]  122 	beq octubre
   0125 C1 0B         [ 2]  123 	cmpb #0xB
   0127 27 CA         [ 3]  124 	beq noviembre
   0129 20 CD         [ 3]  125 	bra diciembre
                            126 
   012B                     127 imprimir:
   012B A6 80         [ 6]  128 	lda ,x+
   012D 10 27 00 D4   [ 6]  129 	lbeq regresar
   0131 B7 FF 00      [ 5]  130 	sta 0xFF00
   0134 20 F5         [ 3]  131 	bra imprimir
                            132 
   0136                     133 sumar_iteracion:
   0136 96 80         [ 4]  134 	lda 0x80
   0138 8B 01         [ 2]  135 	adda #0x01 
   013A 97 80         [ 4]  136 	sta 0x80
   013C 39            [ 5]  137 	rts
                            138 
   013D                     139 sumar_anio:
   013D EC 8D 01 0F   [10]  140 	ldd aNo,pcr
   0141 D3 80         [ 6]  141 	addd 0x80
   0143 1E 89         [ 8]  142 	exg a,b
   0145 17 00 BE      [ 9]  143 	lbsr daa
   0148 1E 89         [ 8]  144 	exg a,b
   014A FD 02 50      [ 6]  145 	std aNo
   014D 96 80         [ 4]  146 	lda 0x080
   014F B7 FF 00      [ 5]  147 	sta 0xFF00
   0152 39            [ 5]  148 	rts
                            149 
   0153                     150 comprobar_bisiesto:
   0153 FC 02 50      [ 6]  151 	ldd aNo
   0156 1F 98         [ 6]  152 	tfr b,a
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 4
Hexadecimal [16-Bits]                                 Tue May 17 01:56:51 2022



   0158 84 01         [ 2]  153 	anda #1
   015A 81 00         [ 2]  154 	cmpa #0x00
   015C 26 20         [ 3]  155 	bne no_bisiesto
   015E 1F 98         [ 6]  156 	tfr b,a
   0160 44            [ 2]  157 	lsra
   0161 84 01         [ 2]  158 	anda #1
   0163 81 00         [ 2]  159 	cmpa #0x00
   0165 26 17         [ 3]  160 	bne no_bisiesto
   0167 B6 02 54      [ 5]  161 	lda dia
   016A F6 02 52      [ 5]  162 	ldb mes
   016D 81 1D         [ 2]  163 	cmpa #0x1D	 		;COMPARA DIA CON 29
   016F 10 23 00 92   [ 6]  164 	lbls regresar 
   0173 80 1D         [ 2]  165 	suba #0x1D
   0175 CB 01         [ 2]  166 	addb #0x01
   0177 B7 02 54      [ 5]  167 	sta dia
   017A F7 02 52      [ 5]  168 	stb mes
   017D 39            [ 5]  169 	rts
                            170 	
   017E                     171 no_bisiesto:
   017E B6 02 54      [ 5]  172 	lda dia
   0181 F6 02 52      [ 5]  173 	ldb mes
   0184 80 1C         [ 2]  174 	suba #0x1C
   0186 CB 01         [ 2]  175 	addb #0x01
   0188 B7 02 54      [ 5]  176 	sta dia
   018B F7 02 52      [ 5]  177 	stb mes
   018E 39            [ 5]  178 	rts
                            179 
   018F                     180 sumar_mes:
   018F B6 02 52      [ 5]  181 	lda mes
   0192 9B 80         [ 4]  182 	adda 0x80
   0194 17 00 6F      [ 9]  183 	lbsr daa
   0197 B7 02 52      [ 5]  184 	sta mes
   019A 39            [ 5]  185 	rts
                            186 
   019B                     187 comprobar_mes:
   019B B6 02 52      [ 5]  188 	lda mes
   019E 80 12         [ 2]  189 	suba #0x12
   01A0 23 63         [ 3]  190 	bls regresar 
   01A2 F6 02 50      [ 5]  191 	ldb aNo
   01A5 CB 01         [ 2]  192 	addb #0x1
   01A7 B7 02 52      [ 5]  193 	sta mes
   01AA F7 02 50      [ 5]  194 	stb aNo
   01AD 39            [ 5]  195 	rts
                            196 
   01AE                     197 suma_dia:
   01AE B6 02 54      [ 5]  198 	lda dia
   01B1 9B 80         [ 4]  199 	adda 0x80
   01B3 17 00 50      [ 9]  200 	lbsr daa
   01B6 B7 02 54      [ 5]  201 	sta dia
                            202 
   01B9                     203 comprobar_dia:
   01B9 B6 02 54      [ 5]  204 	lda dia
   01BC F6 02 52      [ 5]  205 	ldb mes
   01BF 81 28         [ 2]  206 	cmpa #0x28		;COMPARA EL DIA CON 28
   01C1 10 23 00 40   [ 6]  207 	lbls regresar 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 5
Hexadecimal [16-Bits]                                 Tue May 17 01:56:51 2022



   01C5 C1 02         [ 2]  208 	cmpb #0x02
   01C7 10 27 FF 88   [ 6]  209 	lbeq comprobar_bisiesto
   01CB 81 30         [ 2]  210 	cmpa #0x30		;COMPARA EL DIA CON 30
   01CD 10 23 00 34   [ 6]  211 	lbls regresar 
   01D1 C1 04         [ 2]  212 	cmpb #0x04
   01D3 10 27 00 23   [ 6]  213 	lbeq rest_30_sum_mes
   01D7 C1 06         [ 2]  214 	cmpb #0x06
   01D9 10 27 00 1D   [ 6]  215 	lbeq rest_30_sum_mes
   01DD C1 09         [ 2]  216 	cmpb #0x09
   01DF 10 27 00 17   [ 6]  217 	lbeq rest_30_sum_mes
   01E3 C1 11         [ 2]  218 	cmpb #0x11
   01E5 10 27 00 11   [ 6]  219 	lbeq rest_30_sum_mes
   01E9 81 31         [ 2]  220 	cmpa #0x31		;COMPARA EL DIA COM 31
   01EB 10 23 00 16   [ 6]  221 	lbls regresar 
   01EF 80 31         [ 2]  222 	suba #0x31
   01F1 CB 01         [ 2]  223 	addb #0x01
   01F3 B7 02 54      [ 5]  224 	sta dia
   01F6 F7 02 52      [ 5]  225 	stb mes
   01F9 39            [ 5]  226 	rts
                            227 
   01FA                     228 rest_30_sum_mes:
   01FA 80 30         [ 2]  229 	suba #0x30
   01FC CB 01         [ 2]  230 	addb #0x01
   01FE B7 02 54      [ 5]  231 	sta dia
   0201 F7 02 52      [ 5]  232 	stb mes
   0204 39            [ 5]  233 	rts
                            234 	
   0205                     235 regresar:
   0205 39            [ 5]  236   	rts
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 6
Hexadecimal [16-Bits]                                 Tue May 17 01:56:51 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
    Ncumples           **** GX  |     aNo                **** GX
  0 abril              00A4 R   |   0 abril_str          001A R
    acabar             **** GX  |   0 agosto             00B8 R
  0 agosto_str         0039 R   |   0 comprobar_bisi     0127 GR
  0 comprobar_dia      018D GR  |   0 comprobar_mes      016F GR
    daa                **** GX  |     dia                **** GX
  0 diciembre          00CC R   |   0 diciembre_str      0065 R
  0 enero              0095 R   |   0 enero_str          0000 R
  0 febrero            009A R   |   0 febrero_str        0008 R
  0 imprimir           00FF R   |   0 julio              00B3 R
  0 julio_str          0031 R   |   0 junio              00AE R
  0 junio_str          0029 R   |   0 marzo              009F R
  0 marzo_str          0012 R   |   0 mayo               00A9 R
  0 mayo_str           0022 R   |     mes                **** GX
  0 mostrarMes         00D1 GR  |   0 no_bisiesto        0152 R
  0 noviembre          00C7 R   |   0 noviembre_str      0059 R
  0 octubre            00C2 R   |   0 octubre_str        004F R
  0 poner_pila         0071 GR  |   0 regresar           01D9 R
  0 rest_30_sum_me     01CE R   |   0 sacar_pila         0083 GR
  0 septiembre         00BD R   |   0 septiembre_str     0042 R
  0 suma_dia           0182 GR  |   0 sumar_anio         0111 GR
  0 sumar_iteracio     010A GR  |   0 sumar_mes          0163 GR

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 7
Hexadecimal [16-Bits]                                 Tue May 17 01:56:51 2022

Area Table

[_CSEG]
   0 _CODE            size  1DA   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

