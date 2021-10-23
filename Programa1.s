		AREA	|.text|, CODE, READONLY, ALIGN=2
		THUMB
;		EXPORT Programa1
			
Programa1

	MACRO											;Inicio de la Macro
$etiqueta Fact $Resultado, $Numero, $Negativo, $Propiedad, $Factorial, $Anidado
$etiqueta
;--------------------------------------------------Variables de entrada y salida--------------------------------------------------
	VLDR.F32 S0, =$Numero							;N�mero a evaluar
	VLDR.F32 $Resultado, =1							;Registro donde se guarda el resultado
;-----------------------------------------------------Variables de comparaci�n----------------------------------------------------
	VLDR.F32 S4, =0									;Registro con el que se compara para saber si n�mero a evaluar < 0
	VLDR.F32 S5, =1									;Registro con el que se compara para saber si n�mero a evaluar est� entre �[0, 1]
;--------------------------------------------------Saltos en base a comparaciones-------------------------------------------------
;Comparaci�n1
	VCMP.F32 S0, S4									;Se compara n�mero a evaluar respecto a S4=0
	VMRS APSR_nzcv, FPSCR							;Se manda el resultado a las vanderas de FPSR
	BLO	$Negativo									;Si se cumple que n�mero a evaluar < 0, se hace un salto al branch Negativo
;Comparaci�n2
	VCMP.F32 S0, S5									;Se compara n�mero a evaluar respecto a S5=1
	VMRS APSR_nzcv, FPSCR							;Se manda el resultado a las vanderas de FPSR
	BLS $Propiedad									;Si se cumple que n�mero a evaluar est� entre [0, 1], se hace un salto al branch Propiedad
	BHI	$Factorial									;Si se cumple que n�mero a evaluar > 1 entonces se hace un salto al branch Factorial
;----------------------------------------------------Branchs que calculan el factorial--------------------------------------------
;Condici�n de n�mero a evaluar con valor negativo
$Negativo
	VMOV.F32 $Resultado, S4							;La funci�n Pi no convergue en los negativos, no hay factoriales negativos,
	B $Anidado										;se despliega un 0 en donde deber�a estar el resultado del factorial
;Condici�n de n�mero a evaluar con valor entre [0, 1]
$Propiedad											;Una propiedad de los factoriales es que 0! = 1. Se incluy� 1! = 1 por conveniencia
	VMOV.F32 $Resultado, S5
	B $Anidado
;Condici�n de n�mero a evaluar con valor entero positivo
$Factorial
	VMUL.F32 $Resultado, S0							;Se multiplica el n�mero a evaluar por su resultado anterior hasta llegar a 1 y se guarda el resultado
	VSUB.F32 S0, S5									;Se le resta una unidad al n�mero a evaluar
	VCMP.F32 S0, S5									;Se compara si n�mero a evaluar ya lleg� a 1
	VMRS APSR_nzcv, FPSCR							;Se manda el resultado a las vanderas de FPSR
	BNE $Factorial									;Se repite el ciclo hasta que el n�mero a evaluar es 1
	BL $Anidado										;Se redirige a un branch anidado que ejecuta la evaluaci�n del siguiente n�mero
	MEND											;Fin de la macro

	MACRO											;Macro usada para la redefinici�n de la primera macro, sirve para ingresar los n�meros m�s facilmente
$etiqueta Valor $Primero, $Segundo, $Tercero 		
$etiqueta
_Res1 Fact S1, $Primero, Negativo1, Propiedad1, Factorial1, _Res2
_Res2 Fact S2, $Segundo, Negativo2, Propiedad2, Factorial2, _Res3
_Res3 Fact S3, $Tercero, Negativo3, Propiedad3, Factorial3, Loop
	MEND
	
	ALIGN
	END