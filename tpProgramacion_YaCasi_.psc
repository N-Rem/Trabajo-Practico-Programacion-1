

///----------------- PORGRAMA PRINCIPAL---------------------------------
Algoritmo tpProgramacion
	Definir articulos, rta, i Como Entero;
	Definir stock, asd como texto;
	
	Escribir "Ingrese la cantidad de articulos que posee la ferreteria";
	Leer articulos;
	validarNumero(articulos,1);
	
	Dimension stock[articulos,6];
	ingresoDatos(stock,articulos);// ingreso de datos
	validarQuincena(stock,articulos);
	Repetir
		Escribir "------------------------------------->";
		Escribir "1. Mostrar lista de artículos ordenada por descripción";
		Escribir "2. Mostrar lista de artículos ordenada por cantidad vendida";
		Escribir "3. Mostrar stock actual de artículos";
		Escribir "4. Buscar artículo por código";
		Escribir "5. Mostrar estadísticas";
		Escribir "6. Salir";
		leer rta;
		Segun rta Hacer
			1:Escribir "------------------------------------->";
				//procedimiento que muestre la lista de articulos ordenada por descripcion
				//mostrarListaArticulos(stock, articulos,5 ,1);
				ordenarLista(stock,articulos,Falso);
				mostrarLista(stock, articulos, Falso);

			2:
				Escribir "------------------------------------->";
				//ordenar_lista_cantidadVendida(stock,articulos); //procedimiento que muestre la lista de articulos ordenada por cantidad vendida
				//mostrar_lista_cantidadVendida(stock,articulos);
				ordenarLista(stock,articulos,Verdadero); //procedimiento que muestre la lista de articulos ordenada por cantidad vendida
				mostrarLista(stock,articulos, Verdadero);
			3:
				//procedimiento que muestre el stock actual de articulos
				Escribir "------------------------------------->";
				mostrarStockActual(stock, articulos);
			4:
				Escribir "------------------------------------->";
				busqueda(stock,articulos, 0);//procedimiento que busca aritculo por codigo
			5:
				//procedimiento que muestra estadisticas
				mostrarEstadisticas(stock,articulos);
				Escribir "------------------------------------->";
				mostrarPorcentajeVentaQuincena(stock, articulos);
				Escribir "------------------------------------->";
				rubroMayorImporteVentaQuincena(stock, articulos);
				Escribir "------------------------------------->";
			6:
				Escribir "Elijio salir, chau";
			De Otro Modo:
				Escribir "Error";
		FinSegun
	Hasta Que 6==rta
FinAlgoritmo
///----------------------------------------------------------------------------
///----------------- INGRESO DE DATOS -----------------------------------------
SubProceso ingresoDatos(stock,articulos)
	Definir i Como Entero;
	Para i<-0 Hasta articulos - 1 Con Paso 1 Hacer
		Escribir "Ingrese el codigo del ", i+1, "º articulo (codigo de 8 caracteres)";
		Leer stock[i,0];
		Mientras validarCodigo2(stock[i,0]) Hacer
			Escribir "error de ingreso";
			leer stock[i,0];
		FinMientras
		
		Escribir "Ingrese la descripción del ", i+1, "º articulo";
		Leer stock[i,1];
		validarTexto(stock[i,1]);
		
		Escribir "Ingrese el precio de venta del ", i+1, "º articulo";
		leer stock[i,2];
		validarCadenaNum(stock[i,2], 1); ///camiba {i,3} a {i,2};
		
		Escribir "Ingrese la cantidad existente del ", i+1, "º articulo";
		Leer stock[i,3];
		validarCadenaNum(stock[i,3], 0);
		
		Escribir "Ingrese la cantidad vendida 1ª quincena del ", i+1, "º articulo";
		Leer stock[i,4];
		validarCadenaNum(stock[i,4], 0);
		
		Escribir "Ingrese la cantidad vendida 2ª quincena del", i+1, "º articulo";
		Leer stock[i,5];
		validarCadenaNum(stock[i,5],0);
	FinPara 
	
FinSubProceso
///----------------------------------------------------------------------------

Funcion  valido <- validarCodigo2(val)
    definir arregloNumero Como Entero;
	Definir rubro como texto;
	Definir valido como logico;
	rubro = SubCadena(val,0,2);
	
    si Longitud(val) <> 8 | (rubro <> "100" & rubro <> "300" & rubro <> "450" & rubro <> "680" & rubro <> "720") Entonces
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
	FinMientras
FinSubProceso

SubProceso validarCadenaNum(val, mayorA)
	Mientras ConvertirANumero(val) < mayorA Hacer
		Escribir "Error, vuelva a ingresar el numero";
        Leer  val;
	FinMientras
FinSubProceso

SubProceso validarTexto(palabra)
	Mientras Longitud(palabra) == 0 Hacer
		Escribir "Error, vuelva a ingresar la descripcion";
        Leer  palabra;
	FinMientras
FinSubProceso
///opcion 1 y 2
///----------------------------------------------------------------------------
///----------------- ORDENAN E IMPRIMEN EL STOCK -----------------------------------------
SubAlgoritmo ordenarLista(stock,articulos,porVentas)
	Definir i,j,posicion como entero;
	Definir aux como texto;
	Para i<-0 Hasta articulos-2 Con Paso 1 Hacer
		posicion=i;
		Para j<-i+1 Hasta articulos-1 Con Paso 1 Hacer
			Si porVentas Entonces
				si (ConvertirANumero(stock[j,4])+ConvertirANumero(stock[j,5]))  >  (ConvertirANumero(stock[posicion,4])+ConvertirANumero(stock[posicion,5])) Entonces
					posicion=j;
				FinSi
			SiNo
				si (stock[j,1] <  stock[posicion,1]) Entonces
					posicion=j;
				FinSi
			FinSi
			
		FinPara
		
		Para j<-0 Hasta 5 Con Paso 1 Hacer
			aux=stock[i,j];
			stock[i,j]=stock[posicion,j];
			stock[posicion,j]=aux;
		FinPara
	FinPara
FinSubAlgoritmo

SubProceso mostrarLista(stock, articulos, conVentas) 
	Definir  i, j , ventasMes Como Entero;
	Definir montoTotal Como Real;
	montoTotal <- 0;
	Para i <- 0 Hasta articulos -1 Con Paso 1 Hacer
		Si conVentas Entonces
			ventasMes = ConvertirANumero(stock[i,4]) +ConvertirANumero(stock[i,5]);
			montoTotal = montoTotal + ConvertirANumero(stock[i,2]) * ventasMes;
			Escribir "Codigo: ",Stock[i,0], " - Descripcion: ",Stock[i,1]," - Cantidad Total vendida en el mes: ",ventasMes, " - Importe total venta: $", ventasMes* ConvertirANumero(Stock[i,2]);
		SiNo
			Escribir "Codigo: ",Stock[i,0], " - Descripcion: ",Stock[i,1]," - Precio Venta: $",Stock[i,2];
		FinSi
	FinPara
	Si conVentas Entonces
		Escribir "Monto total de ventas en el mes: $", montoTotal;
	FinSi
FinSubProceso
///----------------------------------------------------------------------------

///----------------------------------------------------------------------
///opcion 4
SubProceso busqueda(arreglo,dim, columna)/// busqueda por codigo
	Definir cont, stockActual,totalVendido Como Entero;
	Definir importeTotal Como Real;
	Definir codigo,continuar como texto;
	cont = 0;
	
	Escribir "Ingrese el codigo del articulo que desea buscar";
	Leer codigo;
	Repetir
		Mientras codigo <> arreglo[cont,columna] & cont < dim  Hacer
			cont = cont +1;
		FinMientras
		Si arreglo[cont,columna] == codigo Entonces
			totalVendido = ConvertirANumero(arreglo[cont,4]) + ConvertirANumero(arreglo[cont,5]);
			stockActual = ConvertirANumero(arreglo[cont,3]) - totalVendido;
			importeTotal = totalVendido * ConvertirANumero(arreglo[cont,2]);
			Escribir "Descripcion: ",arreglo[cont,1]," - Precio de venta: $",arreglo[cont,2] ," - Cantidad vendida en primera quincena: ",arreglo[cont,4] ," - Cantidad vendida en segunda quincena: ",arreglo[cont,5] ," - Stock actual: ", stockActual," - Importe total de venta en el mes: $",importeTotal;
		SiNo
			Escribir "No existe articulo con el codigo ingresado";
		FinSi
		Repetir
			Escribir "¿Desea buscar otro articulo?	si/no";
			Leer continuar;
		Mientras Que continuar<>"no" y  continuar<>"si"
		
		si continuar=="si" Entonces
			Escribir "Ingrese el codigo del articulo que desea buscar";
			Leer codigo;
		finsi
	Mientras Que continuar=="no"
FinSubProceso

///----------------------------------------------------------------------
///Opcion 3 

SubProceso  mostrarStockActual(stock, fila)
	Definir i,sumaQuin Como Entero;
	
	Para i <- 0 Hasta fila-1 Con Paso 1 Hacer
		sumaQuin<-ConvertirANumero(stock[i,3])-(ConvertirANumero(stock[i,4]) + ConvertirANumero(stock[i,5]));
		Escribir "codigo: ", stock[i,0], " - Descripcion: ",stock[i,1],"- Stock Actual: ",ConvertirATexto(sumaQuin);
	FinPara
FinSubProceso

///------------------------------------------------------------------------
///Valida las quincenas 
SubProceso validarQuincena(stock, articulo)
	definir i,sumaQuin como entero;
	Para i<- 0 Hasta articulo-1 Con Paso 1 Hacer
		sumaQuin<- ConvertirANumero(stock[i,4]) + ConvertirANumero(stock[i,5]);
		Mientras (sumaQuin > ConvertirANumero(stock[i,3]))  Hacer
			Repetir
				Escribir "La 1ª quinsena del articulo Numero : ", i+1, ": ",stock[i,1]," - no debe ser mayor al stock.";
				Escribir "Ingrese nuevamente la cantidad de stock.";
				Leer stock[i,4];
			Mientras Que  ConvertirANumero(stock[i,4])<0
			Repetir
				Escribir "La 2ª quinsena del articulo Numero ", i+1, ": ",stock[i,1]," - no debe ser mayor al stock.";
				Escribir "Ingrese nuevamente la cantidad de stock.";
				leer stock[i,5];
			Mientras Que  ConvertirANumero(stock[i,5])<0
			sumaQuin<- ConvertirANumero(stock[i,4]) + ConvertirANumero(stock[i,5]);
		FinMientras
	FinPara 
FinSubProceso
///---------------------------------------------------------------------------------------------
///------------------------- MOSTRAR ESTADITAS A-------------------------------------
Funcion num <- acortarDecimal(numDecimal, numDeseados) 
	///--------> acorta el decimal, se le agrega la cadena del numero y la cantidad de numeros deseados, devuelve el decimal acortado.
	definir num como cadena; 
	num <- SubCadena(numDecimal,0,numDeseados);
FinFuncion

SubProceso  mostrarEstadisticas(stock,articulos)
	Definir contRubro_Tornillos_y_Tuercas Como Entero;
	Definir contRubro_Adhesivos como entero;
	Definir contRubro_Herrajes como entero;
	Definir contRubro_Pinturas Como Entero;
	Definir contRubro_Electricidad como entero;
	Definir cantTotal Como Entero;
	Definir i como entero;
	
	
	contRubro_Tornillos_y_Tuercas=0;
	contRubro_Adhesivos=0;
	contRubro_Herrajes=0;
	contRubro_Pinturas=0;
	contRubro_Electricidad=0;
	cantTotal=0;
	Para i<-0 Hasta articulos-1 Con Paso 1 Hacer
		Segun SubCadena(stock[i,0],0,2) Hacer
			"100":
				contRubro_Tornillos_y_Tuercas = contRubro_Tornillos_y_Tuercas + ConvertirANumero(stock[i,4])+ConvertirANumero(stock[i,5]);
			"300":
				contRubro_Adhesivos  = contRubro_Adhesivos  + ConvertirANumero(stock[i,4])+ConvertirANumero(stock[i,5]);
			"450":
				contRubro_Herrajes = contRubro_Herrajes + ConvertirANumero(stock[i,4])+ConvertirANumero(stock[i,5]);
			"680":
				contRubro_Pinturas  = contRubro_Pinturas  + ConvertirANumero(stock[i,4])+ConvertirANumero(stock[i,5]);
			"720":
				contRubro_Electricidad = contRubro_Electricidad + ConvertirANumero(stock[i,4])+ConvertirANumero(stock[i,5]);
		FinSegun
		cantTotal = cantTotal + (ConvertirANumero(stock[i,4])+ConvertirANumero(stock[i,5]));
	FinPara
	Escribir "Porcentaje de la cantidad de artículos vendidos de cada rubro";
	Escribir "        Tornillos y Tuercas: %", acortarDecimal(ConvertirATexto(contRubro_Tornillos_y_Tuercas*(100/cantTotal)), 5); 
	Escribir "        Adhesivo: %",acortarDecimal(ConvertirATexto(contRubro_Adhesivos*(100/cantTotal)),5);
	Escribir "        Herrajes: %",acortarDecimal(ConvertirATexto(contRubro_Herrajes*(100/cantTotal)),5);
	Escribir "        Pinturas: %",acortarDecimal(ConvertirATexto(contRubro_Pinturas*(100/cantTotal)),5);
	Escribir "        Electricidad: %",acortarDecimal(ConvertirATexto(contRubro_Electricidad*(100/cantTotal)),5);
FinSubProceso

///------------------------- MOSTRAR ESTADITAS B-------------------------------------

SubProceso mostrarPorcentajeVentaQuincena(stock, articulos)
    Definir i, j, totalMes Como Entero;
    Definir porcentaje Como Real;
    Definir rubro, quincena Como Texto;
    totalMes <- 0;
    
    Para i <- 0 hasta articulos - 1 Con Paso 1 Hacer
        totalMes <- totalMes + ConvertirANumero(stock[i, 4]) + ConvertirANumero(stock[i, 5]);
    FinPara
    
    Escribir "Porcentaje de venta de cada quincena por Rubro sobre el total del mes: ";
    Para i <- 0 hasta articulos - 1 Con Paso 1 Hacer
        rubro <- Subcadena(stock[i, 0], 0, 2);
        porcentaje <- ((ConvertirANumero(stock[i, 4]) + ConvertirANumero(stock[i, 5])) * 100) / totalMes;
        Escribir "Rubro: ", rubro, " - Porcentaje de venta: ", acortarDecimal(ConvertirATexto(porcentaje),5), "%";
    FinPara
FinSubProceso


///------------------------- MOSTRAR ESTADITAS C-------------------------------------

SubProceso rubroMayorImporteVentaQuincena(stock, articulos)
	definir i, j como entero;
	Definir rubro, mayorImporte como real;
	mayorImporte <- 0;
	rubro <- 0; ///----->agregue la inicialisacion de rubro porque sino daba error.

	para i <- 0 hasta articulos - 1 Con Paso 1 Hacer
        Si ((ConvertirANumero(stock[i, 4]) + ConvertirANumero(stock[i, 5])) * ConvertirANumero(stock[i, 2])) > mayorImporte Entonces
            mayorImporte <- ((ConvertirANumero(stock[i, 4]) + ConvertirANumero(stock[i, 5])) * ConvertirANumero(stock[i, 2]));
        FinSi
	FinPara
	
	Escribir "Rubro con mayor importe total de ventas en cada quincena";
	Escribir "Rubro: ", rubro, " - Importe total:", mayorImporte;
FinSubProceso
