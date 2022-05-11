	.module calculo

	.globl acabar
	.globl comprobar_bisiesto

	.globl Ncumples
	.globl aNo
	.globl dia
	.globl mes

sumar_iteracion:
	lda 0x80
	inca
	sta 0x80

guardar_Pila:
	pshs aNo,pcr
	pshs mes,pcr
	pshs dia,pcr

sacar_Pila:
	puls dia,pcr
	puls mes,pcr
	puls aNo,pcr

sumar_anio:
	ldd aNo,pcr
	addd 0x80

comprobar_bisiesto:
	ldd aNo,pcr
	tfr b,a
	anda #1
	cmpa #0x00
	bne no_bisiesto
	tfr b,a
	lsra
	anda #1
	cmpa #0x00
	bne no_bisiesto

no_bisiesto:
	
