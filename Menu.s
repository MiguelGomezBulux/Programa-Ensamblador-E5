		AREA	|.text|, CODE, READONLY, ALIGN=2
		THUMB
		EXPORT Menu
			INCLUDE	Programa1.s
			INCLUDE Programa2.s

;-------------------------------------------------Inicio del men� principal-----------------------------------------------------
Menu											;Nota: Solo se puede ejecutar un programa a la vez, el programa que se desea utilizar
												;debe estar descomentado y el otro comentado.
;Men� del programa 1
	;A continuaci�n se le presenta una linea de c�digo que representa lo siguiente:
	;1- *Etiqueta por defecto del programa*, *Valor (Indicando que se deben ingresar los n�meros a la par)* y *tres n�meros*
	;	 separados por comas (los que se van a evaluar)
	;2- Para calcular el factorial de los tres n�meros que desee, reemplace los n�meros ya existentes por los valores deseados y 
	;	visualice los resultados en los registros S1, S2 y S3 respectivamente luego de ejecutar el programa
	;3- Tener en cuenta que el espacio del registro es de 32bits por lo que no puede ingresar n�meros mayores a 32
	
;_P1 Valor -9, 0, 12 

;Men� del programa 2
	;A continuaci�n se le presenta una linea de c�digo que representa lo siguiente:
	;1- *Etiqueta por defecto del programa*, *Nombre de la forma geom�trica* que se desea calcular y las *variables de entrada*
	;2-	El c�lculo de �rea se encuentra disponible para las siguientes formas geom�tricas: Trapecio, Triangulo y Poligono (de n lados)
	;3- Se debe escribir el nombre de la figura geom�trica que se deseada en la l�nea de c�digo, luego de ello se debe hacer lo
	;	siguiente en base a la figura seleccionada:
	;		*Para calcular el �rea de un trapecio debe ingresar la magnitud del 'Lado Menor', 'Lado Mayor' y la 'Altura' del mismo
	;		*Para calcular el �rea de un tri�ngulo debe ingresar la magnitud de la 'Base' y 'Altura' del mismo 
	;		*Para calcular el �rea de un poligono regular de n lados debe ingresar la magnitud del 'Lado', 'Radio' y 'Cantidad de lados'
	;4- Luego de ejecutar el codigo la visualizaci�n del resultado se puede encontrar en S0
	
;_P2 Poligono 5, 7, 16	

Loop
	B Loop
	
	ALIGN
	END