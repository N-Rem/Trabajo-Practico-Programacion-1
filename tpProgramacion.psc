Algoritmo tpProgramacion
	Definir articulos, rta, i Como Entero;
	Definir stock, asd como texto;
	
	Escribir "Ingrese la cantidad de articulos que posee la ferreteria";
	Leer articulos;
	validarNumero(articulos,1);
	
	Dimension stock[articulos,6];
	
	Para i<-0 Hasta articulos - 1 Con Paso 1 Hacer
		Escribir "Ingrese el codigo del", i+1, "º articulo";
		Leer stock[i,0];
		Mientras validarCodigo2(stock[i,0]) Hacer
			Escribir "error de ingreso";
			leer stock[i,0];
		Fin Mientras
		
		Escribir "Ingrese la descripción del", i+1, "º articulo";
		Leer stock[i,1];
		validarTexto(stock[i,1]);
		
		Escribir "Ingrese el precio de venta del", i+1, "º articulo";
		leer stock[i,2];
		validarCadenaNum(stock[i,2], 1); ///camiba {i,3} a {i,2};
		
		Escribir "Ingrese la cantidad existente del", i+1, "º articulo";
		Leer stock[i,3];
		validarCadenaNum(stock[i,3], 0);
		
		Escribir "Ingrese la cantidad vendida 1ª quincena del", i+1, "º articulo";
		Leer stock[i,4];
		validarCadenaNum(stock[i,4], 0);
		
		Escribir "Ingrese la cantidad vendida 2ª quincena del", i+1, "º articulo";
		Leer stock[i,5];
		validarCadenaNum(stock[i,5],0);
	Fin Para
	
	//Repetir
	Escribir "1. Mostrar lista de artículos ordenada por descripción";
	Escribir "2. Mostrar lista de artículos ordenada por cantidad vendida";
	Escribir "3. Mostrar stock actual de artículos";
	Escribir "4. Buscar artículo por código";
	Escribir "5. Mostrar estadísticas";
	Escribir "6. Salir";
	leer rta;
	//Mientras rta <> 1 | rta <> 2 | rta <> 3 | rta <> 4 | rta <> 5 | rta <> 6 Hacer ///lo comente porque no me aceptaba la opcion.
	//	Escribir "Error asdasdas";
	//	leer rta;
	//Fin Mientras
	//Hasta Que rta == 6
	
	Segun rta Hacer
		1:
			//procedimiento que muestre la lista de articulos ordenada por descripcion
			mostrarListaArticulos(stock, articulos,5 ,1);
		2:
			//procedimiento que muestre la lista de articulos ordenada por cantidad vendida descripcion
		3:
			//procedimiento que muestre el stock actual de articulos
		4:
			//procedimiento que busca aritculo por codigo
		5:
			//procedimiento que muestra estadisticas
		6:
			Escribir "Elijio salir, chau";
		De Otro Modo:
			Escribir "Error";
	Fin Segun
	
FinAlgoritmo


Funcion  valido <- validarCodigo2(val)
    definir arregloNumero Como Entero;
	Definir rubro como texto;
	Definir valido como logico;
	rubro = SubCadena(val,0,2);
	
	Mostrar Subcadena(val,0,2);
    si Longitud(val) <> 8 | (rubro <> "100" & rubro <> "300" & rubro <> "450" & rubro <> "680" & rubro <> "720")
        valido = Verdadero;
    SiNo
        valido <- Falso;
    FinSi
FinFuncion
////copiaSub numero para que valide numeros enteros y no numeors cadena. 
SubProceso validarNumero(val, mayorA)
	Mientras val < mayorA Hacer
		Escribir "Error, vuelva a ingresar el numero";
        Leer  val;
	Fin Mientras
FinSubProceso

SubProceso validarCadenaNum(val, mayorA)
	Mientras ConvertirANumero(val) < mayorA Hacer
		Escribir "Error, vuelva a ingresar el numero";
        Leer  val;
	Fin Mientras
FinSubProceso

SubProceso validarTexto(palabra)
	Mientras Longitud(palabra) == 0 Hacer
		Escribir "Error, vuelva a ingresar la descripcion";
        Leer  palabra;
	Fin Mientras
FinSubProceso


////opcion 1///
SubProceso ordenarPorCriterio(stock, fila,columna,criterio) ///Ordena la matriz por el criterio dado. fila y columnas totales, sin convertir.
	definir i,j, ordenar Como Entero;
	ordenar <- 1;
	definir aux como cadena; 
	Mientras ordenar == 1 Hacer
		ordenar <- 0;
		Para i <- 0 Hasta fila-2 Con Paso 1 Hacer
			si (stock[i,criterio] > stock[i+1,criterio]) Entonces
				ordenar <- 1;
				
			    Para j <- 0 Hasta columna Con Paso 1 Hacer
					aux <- stock[i+1,j];
					stock[i+1,j] <- stock[i,j];
					stock[i, j]<- aux;
				Fin Para
			FinSi
		Fin Para
	Fin Mientras
FinSubProceso

SubProceso mostrarListaArticulos(stock, fila, columna,inDescripcion) //muestra lista de las 3 primeras columnas, se le ingresa incides totales.
	Definir  i, j Como Entero;
	ordenarPorCriterio(stock,fila,columna, inDescripcion);
	Para i <- 0 Hasta fila Con Paso 1 Hacer
		Escribir "Codigo: ",Stock[i,0], "Descripcion: ",Stock[i,1],"Precio Venta: ",Stock[i,2];
	Fin Para
FinSubProceso
	
	