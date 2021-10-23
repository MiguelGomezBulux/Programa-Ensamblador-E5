		AREA	|.text|, CODE, READONLY, ALIGN=2
		THUMB
		EXPORT Menu
			INCLUDE	Programa1.s
			INCLUDE Programa2.s

;-------------------------------------------------Inicio del menú principal-----------------------------------------------------
Menu											;Nota: Solo se puede ejecutar un programa a la vez, el programa que se desea utilizar
												;debe estar descomentado y el otro comentado.
;Menú del programa 1
	;A continuación se le presenta una linea de código que representa lo siguiente:
	;1- *Etiqueta por defecto del programa*, *Valor (Indicando que se deben ingresar los números a la par)* y *tres números*
	;	 separados por comas (los que se van a evaluar)
	;2- Para calcular el factorial de los tres números que desee, reemplace los números ya existentes por los valores deseados y 
	;	visualice los resultados en los registros S1, S2 y S3 respectivamente luego de ejecutar el programa
	;3- Tener en cuenta que el espacio del registro es de 32bits por lo que no puede ingresar números mayores a 32
	
;_P1 Valor -9, 0, 12 

;Menú del programa 2
	;A continuación se le presenta una linea de código que representa lo siguiente:
	;1- *Etiqueta por defecto del programa*, *Nombre de la forma geométrica* que se desea calcular y las *variables de entrada*
	;2-	El cálculo de área se encuentra disponible para las siguientes formas geométricas: Trapecio, Triangulo y Poligono (de n lados)
	;3- Se debe escribir el nombre de la figura geométrica que se deseada en la línea de código, luego de ello se debe hacer lo
	;	siguiente en base a la figura seleccionada:
	;		*Para calcular el área de un trapecio debe ingresar la magnitud del 'Lado Menor', 'Lado Mayor' y la 'Altura' del mismo
	;		*Para calcular el área de un triángulo debe ingresar la magnitud de la 'Base' y 'Altura' del mismo 
	;		*Para calcular el área de un poligono regular de n lados debe ingresar la magnitud del 'Lado', 'Radio' y 'Cantidad de lados'
	;4- Luego de ejecutar el codigo la visualización del resultado se puede encontrar en S0
	
;_P2 Poligono 5, 7, 16	

Loop
	B Loop
	
	ALIGN
	END