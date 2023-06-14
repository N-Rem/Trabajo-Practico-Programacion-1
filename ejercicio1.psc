Algoritmo ejercicio1
//	Ejercicio 1
//	Se tiene un arreglo con las marcas obtenidas por n corredores separados en categoría
//	femenina y masculina de los últimos tres años para la "Berlin Marathon". Los n corredores que
//	de los que se disponen sus marcas han participado en los últimos 3 años. Tienen 1 marca por año c/u. Calcular:
//		? El mejor promedio de la categoría femenina y el mejor promedio de la categoría
//		masculina para el último año.
//			? El promedio de los últimos años para ambas categorías.
//				? La mejor marca para cualquier categoría de los últimos 3 años.
//					? El promedio por año para cada categoría.
	
	Definir rta Como real
	Definir corredores Como Entero
	Definir listaCorredores como texto
	
	Escribir "ingrese la cantidad de corredores"
	Leer corredores
	Dimension listaCorredores[corredores,5,3]
	
	Para i<-0 Hasta corredores Con Paso 1 Hacer
		Escribir "Ingrese nombre de corredor"
		Leer listaCorredores[i,0,1]
		Escribir "Ingrese su categoria"
		Leer listaCorredores[i,1,1]
		Para j<-1 Hasta 3 Con Paso 1 Hacer
			Escribir "Ingrese su ", j, " marca"
			Leer listaCorredores[i,2,j]
			Escribir "Ingrese la " ,j, " fecha"
			Leer listaCorredores[i,3,j]
		Fin Para		
	FinPara
	promFem2021 = CalcularPromedioCategoria(listaCorredores, corredores, "f", 2021)
	promMas2021 = CalcularPromedioCategoria(listaCorredores, corredores, "m", 2021)
	promFem2022 = CalcularPromedioCategoria(listaCorredores, corredores, "f", 2022)
	promMas2022 = CalcularPromedioCategoria(listaCorredores, corredores, "m", 2022)
	promFem2023 = CalcularPromedioCategoria(listaCorredores, corredores, "f", 2023)
	promMas2023 = CalcularPromedioCategoria(listaCorredores, corredores, "m", 2023)
	
	Escribir "El mejor promedio de la categoria femenina en 2023 es: ", promFem2023
	Escribir "El mejor promedio de la categoria masculina en 2023 es: ", promMas2023
	Escribir "El promedio de los últimos años para ambas categorías es: ", promFem2021 + promFem2022+promFem2023+promMas2021+promMas2022+promMas2023
	Escribir " La mejor marca para cualquier categoría de los últimos 3 años: "
	ImprimirLista(MejorMarca(listaCorredores,corredores),corredores)
	Escribir "Fem: 2021: ",promFem2021 ," 2022: ", promFem2022, " 2023: ", promFem2023, "Masc: 2021: ", promMas2021, " 2022: ",promMas2022, " 2023: ",promMas2023
	
FinAlgoritmo



Funcion  promedio <- CalcularPromedioCategoria(lista, dim, categoria, año)
	Definir promedio, suma Como Real
	suma <-0
	contador <- 0
	Para i<-0 Hasta dim -1 Con Paso 1 Hacer
		Para j<-0 Hasta 3 Con Paso 1 Hacer
			Si lista[i,1,1] == categoria & SubCadena(lista[i,3,j],6,9) == año Entonces
				suma = suma + ConvertirANumero(lista[i,2,j])
				contador = contador + 1
			Fin Si
		Fin Para
		
	Fin Para
	promedio = suma/ contador
	
FinFuncion

funcion marca <- MejorMarca(lista,dim)
	Definir min, suma Como Real
	Definir marca como texto
	Dimension marca[dim]
	min <- 0
	Para i<-0 Hasta dim Con Paso 1 Hacer
		Para j<-0 Hasta 3 Con Paso 1 Hacer
			Si min == 0 ||  ConvertirANumero(lista[i,2,j]) < min Entonces
				min = ConvertirANumero(lista[i,2,j])
			Fin Si
		Fin Para
		
	Fin Para
FinFuncion

SubProceso ImprimirLista(lista,dim)
	Para i<-0 Hasta dim -1 Con Paso 1 Hacer
		Escribir Sin Saltar lista[i], " - "
	Fin Para
FinSubProceso
