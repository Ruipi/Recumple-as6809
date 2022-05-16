ASxxxx Assembler V05.40  (Motorola 6809)                                Page 1
Hexadecimal [16-Bits]                                 Mon May 16 22:48:39 2022



                              1 
                              2     .module recumple
                              3 
                              4     .area PROG (ABS)
                              5 
   0250                       6     .org 0x250
                              7 	.globl imprime
                              8     .globl acabar
                              9     .globl mostrarMes
                             10     .globl comprobar_bisiesto
                             11 	.globl sumar_anio
                             12 	.globl sumar_mes
                             13 	.globl comprobar_mes
                             14 	.globl comprobar_dia
                             15 	.globl suma_dia
                             16 	.globl sumar_iteracion
                             17 	.globl sacar_pila
                             18 	.globl poner_pila
                             19     .globl daa
                             20     .globl aNo
                             21     .globl mes
                             22     .globl dia
                             23     .globl Ncumples
                             24 
   0250 19 76                25 aNo:            .word 0x1976 	; Año de nacimiento (BCD) 
   0252 00 07                26 mes:	    	.word 0x7		; Mes de nacimiento (BCD) 
   0254 00 27                27 dia:	        .word 0x27		; Dia de nacimiento (BCD)
   0256 10                   28 Ncumples:     	.byte 0x10		; Numero de Recumples a calcular
                             29 
   0257                      30 programa:
   0257 10 CE F0 00   [ 4]   31 	lds #0xF000
   025B CE F1 00      [ 3]   32 	ldu #0xF100
   025E 86 00         [ 2]   33 	lda #0
   0260 97 80         [ 4]   34 	sta 0x80
   0262 17 FE 15      [ 9]   35 	lbsr poner_pila
                             36 
   0265                      37 bucle_n_cumple:
   0265 17 FE 22      [ 9]   38 	lbsr sacar_pila
   0268 17 FE 0F      [ 9]   39 	lbsr poner_pila
   026B 17 FE A7      [ 9]   40 	lbsr sumar_anio
   026E 17 FE E7      [ 9]   41 	lbsr sumar_mes
   0271 17 FE ED      [ 9]   42 	lbsr comprobar_mes
   0274 17 FE FD      [ 9]   43 	lbsr suma_dia
   0277 17 FF 02      [ 9]   44 	lbsr comprobar_dia
                             45 
   027A B6 02 54      [ 5]   46 	lda dia
   027D 17 FF 3B      [ 9]   47 	lbsr daa
   0280 B7 02 54      [ 5]   48 	sta dia
   0283 17 FD 7A      [ 9]   49 	lbsr imprime
   0286 17 00 40      [ 9]   50 	lbsr imprime_salto
                             51 	
   0289 F6 02 52      [ 5]   52 	ldb mes
   028C 17 FF 2C      [ 9]   53 	lbsr daa
   028F F7 02 52      [ 5]   54 	stb mes
   0292 17 FD 6B      [ 9]   55 	lbsr imprime
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 2
Hexadecimal [16-Bits]                                 Mon May 16 22:48:39 2022



   0295 17 00 31      [ 9]   56 	lbsr imprime_salto
                             57 
                             58 	;0x19XX/20XX -> daa -> sta ultimo XX -> 1900/2000 -> cmp 0x2000 blo 19 -> 20
   0298 FC 02 50      [ 6]   59 	ldd aNo
   029B 1E 89         [ 8]   60 	exg a,b
   029D 17 FF 1B      [ 9]   61 	lbsr daa
   02A0 B7 02 50      [ 5]   62 	sta aNo
   02A3 81 20         [ 2]   63 	cmpa #0x20
   02A5 25 17         [ 3]   64 	blo imprime_19
   02A7 C6 14         [ 2]   65 	ldb #20
   02A9 17 FD 54      [ 9]   66 	lbsr imprime
   02AC F6 02 50      [ 5]   67 	ldb aNo
   02AF 17 FD 4E      [ 9]   68 	lbsr imprime
                             69 
                             70 	;bsr presentar
   02B2 17 FE 5A      [ 9]   71 	lbsr sumar_iteracion
   02B5 96 80         [ 4]   72 	lda 0x80
   02B7 B1 02 56      [ 5]   73 	cmpa Ncumples
   02BA 23 A9         [ 3]   74 	bls bucle_n_cumple
   02BC 20 11         [ 3]   75 	bra acabar
                             76 
   02BE                      77 imprime_19:
   02BE C6 13         [ 2]   78 	ldb #19
   02C0 17 FD 3D      [ 9]   79 	lbsr imprime
   02C3 F6 02 50      [ 5]   80 	ldb aNo
   02C6 17 FD 37      [ 9]   81 	lbsr imprime
                             82 
   02C9                      83 imprime_salto:
   02C9 86 0A         [ 2]   84 	lda #'\n
   02CB B7 FF 00      [ 5]   85 	sta 0xFF00
   02CE 39            [ 5]   86 	rts
                             87 
   02CF                      88 acabar: 
   02CF 4F            [ 2]   89 	clra
   02D0 B7 FF 01      [ 5]   90 	sta 0xFF01
                             91 
   FFFE                      92 	.org 0xFFFE
   FFFE 02 57                93 	.word programa
                             94 
ASxxxx Assembler V05.40  (Motorola 6809)                                Page 3
Hexadecimal [16-Bits]                                 Mon May 16 22:48:39 2022

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  2 Ncumples           0256 GR  |   2 aNo                0250 GR
  2 acabar             02CF GR  |   2 bucle_n_cumple     0265 R
    comprobar_bisi     **** GX  |     comprobar_dia      **** GX
    comprobar_mes      **** GX  |     daa                **** GX
  2 dia                0254 GR  |     imprime            **** GX
  2 imprime_19         02BE R   |   2 imprime_salto      02C9 R
  2 mes                0252 GR  |     mostrarMes         **** GX
    poner_pila         **** GX  |   2 programa           0257 R
    sacar_pila         **** GX  |     suma_dia           **** GX
    sumar_anio         **** GX  |     sumar_iteracio     **** GX
    sumar_mes          **** GX

ASxxxx Assembler V05.40  (Motorola 6809)                                Page 4
Hexadecimal [16-Bits]                                 Mon May 16 22:48:39 2022

Area Table

[_CSEG]
   0 _CODE            size    0   flags C080
   2 PROG             size    0   flags  908
[_DSEG]
   1 _DATA            size    0   flags C0C0

