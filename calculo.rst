ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Tue May 17 15:36:33 2022



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
Hexadecimal [16-Bits]                                 Tue May 17 15:36:33 2022



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
   00C4 20 68         [ 3]   56 	bra imprimir
                             57 
   00C6                      58 febrero:
   00C6 8E 00 34      [ 3]   59 	ldx #febrero_str
   00C9 20 63         [ 3]   60 	bra imprimir
                             61 
   00CB                      62 marzo:
   00CB 8E 00 3E      [ 3]   63 	ldx #marzo_str
   00CE 20 5E         [ 3]   64 	bra imprimir
                             65 
   00D0                      66 abril:
   00D0 8E 00 46      [ 3]   67 	ldx #abril_str
   00D3 20 59         [ 3]   68 	bra imprimir
                             69 
   00D5                      70 mayo:
   00D5 8E 00 4E      [ 3]   71 	ldx #mayo_str
   00D8 20 54         [ 3]   72 	bra imprimir
                             73 
   00DA                      74 junio:
   00DA 8E 00 55      [ 3]   75 	ldx #junio_str
   00DD 20 4F         [ 3]   76 	bra imprimir
                             77 
   00DF                      78 julio:
   00DF 8E 00 5D      [ 3]   79 	ldx #julio_str
   00E2 20 4A         [ 3]   80 	bra imprimir
                             81 
   00E4                      82 agosto:
   00E4 8E 00 65      [ 3]   83 	ldx #agosto_str
   00E7 20 45         [ 3]   84 	bra imprimir
                             85 
   00E9                      86 septiembre:
   00E9 8E 00 6E      [ 3]   87 	ldx #septiembre_str
   00EC 20 40         [ 3]   88 	bra imprimir
                             89 
   00EE                      90 octubre:
   00EE 8E 00 7B      [ 3]   91 	ldx #octubre_str
   00F1 20 3B         [ 3]   92 	bra imprimir
                             93 
   00F3                      94 noviembre:
   00F3 8E 00 85      [ 3]   95 	ldx #noviembre_str
   00F6 20 36         [ 3]   96 	bra imprimir
                             97 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Tue May 17 15:36:33 2022



   00F8                      98 diciembre:
   00F8 8E 00 91      [ 3]   99 	ldx #diciembre_str
   00FB 20 31         [ 3]  100 	bra imprimir
                            101 
   00FD                     102 mostrarMes:
   00FD F6 02 52      [ 5]  103 	ldb mes
   0100 C1 01         [ 2]  104 	cmpb #0x1
   0102 27 BD         [ 3]  105 	beq enero
   0104 C1 02         [ 2]  106 	cmpb #0x2
   0106 27 BE         [ 3]  107 	beq febrero
   0108 C1 03         [ 2]  108 	cmpb #0x3
   010A 27 BF         [ 3]  109 	beq marzo
   010C C1 04         [ 2]  110 	cmpb #0x4
   010E 27 C0         [ 3]  111 	beq abril
   0110 C1 05         [ 2]  112 	cmpb #0x5
   0112 27 C1         [ 3]  113 	beq mayo
   0114 C1 06         [ 2]  114 	cmpb #0x6
   0116 27 C2         [ 3]  115 	beq junio
   0118 C1 07         [ 2]  116 	cmpb #0x7
   011A 27 C3         [ 3]  117 	beq julio
   011C C1 08         [ 2]  118 	cmpb #0x8
   011E 27 C4         [ 3]  119 	beq agosto
   0120 C1 09         [ 2]  120 	cmpb #0x9
   0122 27 C5         [ 3]  121 	beq septiembre
   0124 C1 0A         [ 2]  122 	cmpb #0xA
   0126 27 C6         [ 3]  123 	beq octubre
   0128 C1 0B         [ 2]  124 	cmpb #0xB
   012A 27 C7         [ 3]  125 	beq noviembre
   012C 20 CA         [ 3]  126 	bra diciembre
                            127 
   012E                     128 imprimir:
   012E A6 80         [ 6]  129 	lda ,x+
   0130 10 27 00 D2   [ 6]  130 	lbeq regresar
   0134 B7 FF 00      [ 5]  131 	sta 0xFF00
   0137 20 F5         [ 3]  132 	bra imprimir
                            133 
   0139                     134 sumar_iteracion:
   0139 96 80         [ 4]  135 	lda 0x80
   013B 8B 01         [ 2]  136 	adda #0x01 
   013D 97 80         [ 4]  137 	sta 0x80
   013F 39            [ 5]  138 	rts
                            139 
   0140                     140 sumar_anio:
   0140 EC 8D 01 0C   [10]  141 	ldd aNo,pcr
   0144 1E 89         [ 8]  142 	exg a,b
   0146 9B 80         [ 4]  143 	adda 0x80
   0148 17 00 BC      [ 9]  144 	lbsr daa
   014B 1E 89         [ 8]  145 	exg a,b
   014D 89 00         [ 2]  146 	adca #0x0
   014F FD 02 50      [ 6]  147 	std aNo
   0152 39            [ 5]  148 	rts
                            149 
   0153                     150 comprobar_bisiesto:
   0153 FC 02 50      [ 6]  151 	ldd aNo
   0156 1F 98         [ 6]  152 	tfr b,a
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 4
Hexadecimal [16-Bits]                                 Tue May 17 15:36:33 2022



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
   016F 10 23 00 93   [ 6]  164 	lbls regresar 
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
   0194 17 00 70      [ 9]  183 	lbsr daa
   0197 B7 02 52      [ 5]  184 	sta mes
   019A 39            [ 5]  185 	rts
                            186 
   019B                     187 comprobar_mes:
   019B B6 02 52      [ 5]  188 	lda mes
   019E 80 12         [ 2]  189 	suba #0x12
   01A0 23 64         [ 3]  190 	bls regresar 
   01A2 F6 02 50      [ 5]  191 	ldb aNo
   01A5 CB 01         [ 2]  192 	addb #0x1
   01A7 B7 02 52      [ 5]  193 	sta mes
   01AA F7 02 50      [ 5]  194 	stb aNo
   01AD 39            [ 5]  195 	rts
                            196 
   01AE                     197 suma_dia:
   01AE B6 02 54      [ 5]  198 	lda dia
   01B1 9B 80         [ 4]  199 	adda 0x80
   01B3 17 00 51      [ 9]  200 	lbsr daa
   01B6 B7 02 54      [ 5]  201 	sta dia
   01B9 39            [ 5]  202 	rts
                            203 
   01BA                     204 comprobar_dia:
   01BA B6 02 54      [ 5]  205 	lda dia
   01BD F6 02 52      [ 5]  206 	ldb mes
   01C0 81 28         [ 2]  207 	cmpa #0x28		;COMPARA EL DIA CON 28
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 5
Hexadecimal [16-Bits]                                 Tue May 17 15:36:33 2022



   01C2 10 23 00 40   [ 6]  208 	lbls regresar 
   01C6 C1 02         [ 2]  209 	cmpb #0x02
   01C8 10 27 FF 87   [ 6]  210 	lbeq comprobar_bisiesto
   01CC 81 30         [ 2]  211 	cmpa #0x30		;COMPARA EL DIA CON 30
   01CE 10 23 00 34   [ 6]  212 	lbls regresar 
   01D2 C1 04         [ 2]  213 	cmpb #0x04
   01D4 10 27 00 23   [ 6]  214 	lbeq rest_30_sum_mes
   01D8 C1 06         [ 2]  215 	cmpb #0x06
   01DA 10 27 00 1D   [ 6]  216 	lbeq rest_30_sum_mes
   01DE C1 09         [ 2]  217 	cmpb #0x09
   01E0 10 27 00 17   [ 6]  218 	lbeq rest_30_sum_mes
   01E4 C1 11         [ 2]  219 	cmpb #0x11
   01E6 10 27 00 11   [ 6]  220 	lbeq rest_30_sum_mes
   01EA 81 31         [ 2]  221 	cmpa #0x31		;COMPARA EL DIA COM 31
   01EC 10 23 00 16   [ 6]  222 	lbls regresar 
   01F0 80 31         [ 2]  223 	suba #0x31
   01F2 CB 01         [ 2]  224 	addb #0x01
   01F4 B7 02 54      [ 5]  225 	sta dia
   01F7 F7 02 52      [ 5]  226 	stb mes
   01FA 39            [ 5]  227 	rts
                            228 
   01FB                     229 rest_30_sum_mes:
   01FB 80 30         [ 2]  230 	suba #0x30
   01FD CB 01         [ 2]  231 	addb #0x01
   01FF B7 02 54      [ 5]  232 	sta dia
   0202 F7 02 52      [ 5]  233 	stb mes
   0205 39            [ 5]  234 	rts
                            235 	
   0206                     236 regresar:
   0206 39            [ 5]  237   	rts
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 6
Hexadecimal [16-Bits]                                 Tue May 17 15:36:33 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
    Ncumples           **** GX  |     aNo                **** GX
  0 abril              00A4 R   |   0 abril_str          001A R
    acabar             **** GX  |   0 agosto             00B8 R
  0 agosto_str         0039 R   |   0 comprobar_bisi     0127 GR
  0 comprobar_dia      018E GR  |   0 comprobar_mes      016F GR
    daa                **** GX  |     dia                **** GX
  0 diciembre          00CC R   |   0 diciembre_str      0065 R
  0 enero              0095 R   |   0 enero_str          0000 R
  0 febrero            009A R   |   0 febrero_str        0008 R
  0 imprimir           0102 R   |   0 julio              00B3 R
  0 julio_str          0031 R   |   0 junio              00AE R
  0 junio_str          0029 R   |   0 marzo              009F R
  0 marzo_str          0012 R   |   0 mayo               00A9 R
  0 mayo_str           0022 R   |     mes                **** GX
  0 mostrarMes         00D1 GR  |   0 no_bisiesto        0152 R
  0 noviembre          00C7 R   |   0 noviembre_str      0059 R
  0 octubre            00C2 R   |   0 octubre_str        004F R
  0 poner_pila         0071 GR  |   0 regresar           01DA R
  0 rest_30_sum_me     01CF R   |   0 sacar_pila         0083 GR
  0 septiembre         00BD R   |   0 septiembre_str     0042 R
  0 suma_dia           0182 GR  |   0 sumar_anio         0114 GR
  0 sumar_iteracio     010D GR  |   0 sumar_mes          0163 GR

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 7
Hexadecimal [16-Bits]                                 Tue May 17 15:36:33 2022

Area Table

[_CSEG]
   0 _CODE            size  1DB   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

