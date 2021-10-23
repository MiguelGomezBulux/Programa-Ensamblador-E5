		AREA	|.text|, CODE, READONLY, ALIGN=2
		THUMB
;		EXPORT Programa2
			
Programa2

;-------------------------------------------Cálculo del área del trapecio-----------------------------------------
	MACRO								;Inicio Macro trapecio
$etiqueta Trapecio	$Lado_menor, $Lado_mayor, $Altura
;--------------------------------Ingreso de variables a evaluar en la función de área-----------------------------
AreaTrapecio
	VLDR.F32 S4, =$Lado_menor			;Lado menor
	VLDR.F32 S5, =$Lado_mayor			;Lado mayor
	VLDR.F32 S6, =$Altura				;Altura
	VLDR.F32 S7, =2						;Constante de división $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	B SolucionTrapecio					;Redirige al branch SoluciónTrapecio
;----------------------------------Evaluación de las variables en la función de área-------------------------------
SolucionTrapecio
	VADD.F32 S8, S4, S5					;(Lado menor + Lado mayor)
	VMUL.F32 S9, S8, S6					;(Lado menor + Lado mayor)*Altura
	VDIV.F32 S0, S9, S7					;Área = ((Lado menor + Lado mayor)*Altura)/2
	B Loop								;Redirige al loop del fichero Menu,s que finaliza el programa		
	MEND								;Fin macro trapecio

;-------------------------------------------Cálculo del área del triángulo-----------------------------------------
	MACRO								;Inicio macro triángulo
$etiqueta Triangulo	$Base, $Altura
;--------------------------------Ingreso de variables a evaluar en la función de área-----------------------------
AreaTriangulo
	VLDR.F32 S4, =$Base					;Base
	VLDR.F32 S5, =$Altura				;Altura
	VLDR.F32 S7, =2						;Constante de división $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	B SolucionTriangulo					;Redirige al branch SoluciónTriángulo
;----------------------------------Evaluación de las variables en la función de área-------------------------------	
SolucionTriangulo
	VMUL.F32 S8, S4, S5					;Base*Altura
	VDIV.F32 S0, S8, S7					;Área = (Base*Altura)/2
	B Loop								;Redirige al loop del fichero Menu,s que finaliza el programa
	MEND								;Fin macro triángulo

;-------------------------------------------Cálculo del área del polígono-----------------------------------------
	MACRO								;Inicio macro polígono regular de n lados
$etiqueta Poligono	$Lado, $Radio, $Cantidad_Lados
;--------------------------------Ingreso de variables a evaluar en la función de área-----------------------------
AreaPoligonoRegular
	VLDR.F32 S4, =$Lado					;Lado
	VLDR.F32 S5, =$Radio				;Radio
	VLDR.F32 S6, =$Cantidad_Lados		;Cantidad de lados
	VLDR.F32 S7, =2						;Constante de división $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	B SolucionPoligonoRegular			;Redirige al branch SoluciónPolígonoRegular
;----------------------------------Evaluación de las variables en la función de área-------------------------------	
SolucionPoligonoRegular
	VDIV.F32 S8, S4, S7					;Lado/2
	VMUL.F32 S9, S8 ,S8					;(Lado/2)^2
	VMUL.F32 S8, S5, S5					;R^2
	VSUB.F32 S10, S8, S9				;R^2-(Lado/2)^2
	VSQRT.F32 S8, S10					;Apotema = Sqrt(R^2-(Lado/2)^2)
	VMUL.F32 S9, S4, S6					;Perímetro
	VMUL.F32 S10, S8, S9				;Apotema*Perímetro
	VDIV.F32 S0, S10, S7				;Área = (Apotema*Perímetro)/2
	B Loop								;Redirige al loop del fichero Menu,s que finaliza el programa
	MEND								;Fin macro poligono regular de n lados
	
	ALIGN
	END
