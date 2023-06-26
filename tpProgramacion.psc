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
		validarNumero(stock[i,3], 1);
		
		Escribir "Ingrese la cantidad existente del", i+1, "º articulo";
		Leer stock[i,3];
		validarNumero(stock[i,3], 0);
		
		Escribir "Ingrese la cantidad vendida 1ª quincena del", i+1, "º articulo";
		Leer stock[i,4];
		validarNumero(stock[i,4], 0);
	
		Escribir "Ingrese la cantidad vendida 2ª quincena del", i+1, "º articulo";
		Leer stock[i,5];
		validarNumero(stock[i,5],0);
	Fin Para
	
	Repetir
		Escribir "1. Mostrar lista de artículos ordenada por descripción";
		Escribir "2. Mostrar lista de artículos ordenada por cantidad vendida";
		Escribir "3. Mostrar stock actual de artículos";
		Escribir "4. Buscar artículo por código";
		Escribir "5. Mostrar estadísticas";
		Escribir "6. Salir";
		leer rta;
		Mientras rta <> 1 | rta <> 2 | rta <> 3 | rta <> 4 | rta <> 5 | rta <> 6 Hacer
			Escribir "Error asdasdas";
			leer rta;
		Fin Mientras
	Hasta Que rta == 6
	
	Segun rta Hacer
		1:
			//procedimiento que muestre la lista de articulos ordenada por descripcion
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

SubProceso validarNumero(val, mayorA)
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
	