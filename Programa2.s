		AREA	|.text|, CODE, READONLY, ALIGN=2
		THUMB
;		EXPORT Programa2
			
Programa2

;-------------------------------------------C�lculo del �rea del trapecio-----------------------------------------
	MACRO								;Inicio Macro trapecio
$etiqueta Trapecio	$Lado_menor, $Lado_mayor, $Altura
;--------------------------------Ingreso de variables a evaluar en la funci�n de �rea-----------------------------
AreaTrapecio
	VLDR.F32 S4, =$Lado_menor			;Lado menor
	VLDR.F32 S5, =$Lado_mayor			;Lado mayor
	VLDR.F32 S6, =$Altura				;Altura
	VLDR.F32 S7, =2						;Constante de divisi�n $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	B SolucionTrapecio					;Redirige al branch Soluci�nTrapecio
;----------------------------------Evaluaci�n de las variables en la funci�n de �rea-------------------------------
SolucionTrapecio
	VADD.F32 S8, S4, S5					;(Lado menor + Lado mayor)
	VMUL.F32 S9, S8, S6					;(Lado menor + Lado mayor)*Altura
	VDIV.F32 S0, S9, S7					;�rea = ((Lado menor + Lado mayor)*Altura)/2
	B Loop								;Redirige al loop del fichero Menu,s que finaliza el programa		
	MEND								;Fin macro trapecio

;-------------------------------------------C�lculo del �rea del tri�ngulo-----------------------------------------
	MACRO								;Inicio macro tri�ngulo
$etiqueta Triangulo	$Base, $Altura
;--------------------------------Ingreso de variables a evaluar en la funci�n de �rea-----------------------------
AreaTriangulo
	VLDR.F32 S4, =$Base					;Base
	VLDR.F32 S5, =$Altura				;Altura
	VLDR.F32 S7, =2						;Constante de divisi�n $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	B SolucionTriangulo					;Redirige al branch Soluci�nTri�ngulo
;----------------------------------Evaluaci�n de las variables en la funci�n de �rea-------------------------------	
SolucionTriangulo
	VMUL.F32 S8, S4, S5					;Base*Altura
	VDIV.F32 S0, S8, S7					;�rea = (Base*Altura)/2
	B Loop								;Redirige al loop del fichero Menu,s que finaliza el programa
	MEND								;Fin macro tri�ngulo

;-------------------------------------------C�lculo del �rea del pol�gono-----------------------------------------
	MACRO								;Inicio macro pol�gono regular de n lados
$etiqueta Poligono	$Lado, $Radio, $Cantidad_Lados
;--------------------------------Ingreso de variables a evaluar en la funci�n de �rea-----------------------------
AreaPoligonoRegular
	VLDR.F32 S4, =$Lado					;Lado
	VLDR.F32 S5, =$Radio				;Radio
	VLDR.F32 S6, =$Cantidad_Lados		;Cantidad de lados
	VLDR.F32 S7, =2						;Constante de divisi�n $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	B SolucionPoligonoRegular			;Redirige al branch Soluci�nPol�gonoRegular
;----------------------------------Evaluaci�n de las variables en la funci�n de �rea-------------------------------	
SolucionPoligonoRegular
	VDIV.F32 S8, S4, S7					;Lado/2
	VMUL.F32 S9, S8 ,S8					;(Lado/2)^2
	VMUL.F32 S8, S5, S5					;R^2
	VSUB.F32 S10, S8, S9				;R^2-(Lado/2)^2
	VSQRT.F32 S8, S10					;Apotema = Sqrt(R^2-(Lado/2)^2)
	VMUL.F32 S9, S4, S6					;Per�metro
	VMUL.F32 S10, S8, S9				;Apotema*Per�metro
	VDIV.F32 S0, S10, S7				;�rea = (Apotema*Per�metro)/2
	B Loop								;Redirige al loop del fichero Menu,s que finaliza el programa
	MEND								;Fin macro poligono regular de n lados
	
	ALIGN
	END
