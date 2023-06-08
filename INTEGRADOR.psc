Funcion crearCuenta()
		Definir nombre, apellido, sexo, nomUsu, clave, aux, nacionalidad Como Caracter;
		Definir documento, edad Como Entero;
		
		Escribir Sin Saltar "Nombre: ";
		Leer nombre;
		Escribir Sin Saltar "Apellido: ";
		Leer apellido;
		Escribir Sin Saltar "Edad: ";
		Leer edad;
		Escribir Sin Saltar "Nacionalidad: ";
		Leer nacionalidad;
		Escribir Sin Saltar "Nro de documento: ";
		Leer documento;
		Escribir Sin Saltar "Sexo: ";
		Leer sexo;
		Escribir Sin Saltar "Nombre de usuario: ";
		Leer nomUsu;
		Escribir Sin Saltar "Genere una clave: ";
		Leer clave;
		Escribir Sin Saltar "Vuelva a escribir la clave para confirmar: ";
		Leer aux;
FinFuncion

Funcion iniciarSesion()
	Definir usuario, contrasenia Como caracter;
	
	Escribir "";
	Escribir Sin Saltar "Ingrese su usuario: ";
	Leer usuario;
	Escribir "";
	Escribir Sin Saltar "Ingrese la clave: ";
	Leer contrasenia;
	
	Escribir "";
	Escribir Sin Saltar "Olvide mi contrase�a ";
	
	Escribir "";
	Escribir "Registrate ";
FinFuncion




Proceso Proyecto_Integrador
	Definir usuario, contrasenia Como Caracter;
	Definir cuenta Como Logico;
	Definir opc Como Entero;
	Definir balance Como Entero;
	Definir balanceInicial Como Entero;
	cuenta <- Falso;
	balance <- 0;
	balanceInicial <- 10000;
	
	Escribir "Bienvenidos al HomeBanking de la UTN-SR";
	
	Escribir "";
	Escribir "1-	Iniciar sesion ";
	Escribir "";
	Escribir "2-	Crear cuenta: ";
	Leer opc;
	Segun opc Hacer
		1:
			cuenta <- Verdadero;
			iniciarSesion();
			balance <- balanceInicial;
 		2:
			cuenta <- Falso;
			crearCuenta();
		De Otro Modo:
			Escribir "Opcion no valida, por favor ingrese una opcion correcta.";
	FinSegun
	
	Limpiar Pantalla;
	mostrarMenuPrincipal(balance);
FinProceso

SubProceso mostrarMenuPrincipal(balance)  // Menu principal
	separar();
	Escribir "     HomeBanking de la UTN-SR";
	separar();
	mostrarCuenta(balance);
	Escribir "�Qu� desea hacer?";
	Escribir  " 1 - Depositar";
	Escribir  " 2 - Realizar transaccion";
	Escribir  " 4 - Pagar servicios";
	Escribir  " 5 - Administar tarjeta";
	Escribir  " 0 - Cerrar sesion";
	Leer opc;
	
	Segun opc Hacer
		1:
			mostrarMenuDepositar(balance);
		2:
			mostrarMenuTransaccion(balance);
		4:
			pagoDeServicios(balance);
		De Otro Modo:
			opc <- -1;
	Fin Segun
	
	Si opc = -1 Entonces
		LimpiarPantalla;
		mostrarMenuPrincipal(balance);
	FinSi
FinSubProceso

Funcion separar()
	Escribir "------------------------------------------";
FinFuncion

Funcion  mostrarCuenta(balance)
	Escribir " Cuenta: 09-0925566-23: $", balance;
FinFuncion

Funcion mostrarMenuDepositar(balance)
	Definir monto como entero;
	Definir continuar como entero;
	mostrarCuenta(balance);
	Escribir "Escribe el monto que quieres depositar en tu cuenta.";
	Leer monto;
	Escribir "Se ha realizado un deposito de ", monto;
	balance <- balance + monto;
	mostrarCuenta(balance);
	Escribir "Quieres continuar navegando? (1 - Si, X - No)";
	Leer continuar;
	Si continuar = 1 entonces
		mostrarMenuPrincipal(balance);
	FinSi
FinFuncion

Funcion mostrarMenuTransaccion(balance)
	Definir monto como entero;
	Definir cbu como entero;
	Definir continuar como entero;
	mostrarCuenta(balance);
	Escribir "Escribe el CBU destinatario";
	Leer cbu;
	Escribir "Escribe el monto de la transaccion";
	Leer monto;
	Escribir "Se ha realizado una transaccion de ", monto;
	Escribir "Para el CBU destinatario", cbu;
	balance <- balance - monto;
	mostrarCuenta(balance);
	Escribir "Quieres continuar? (1 - Si, X - No)";
	Leer continuar;
	Si continuar = 1 entonces
		mostrarMenuPrincipal(balance);
	FinSi
FinFuncion


// PAGO DE SERVICIOS ===================================
//El programa esta realizado completamente con SubProcesos para poder ser invocado sin problemas en el men� principal del homebanking.
//solo ser� necesario copiar el c�digo completo (sin el proceso principal) e invocarlo de la misma forma que lo hago al final del c�digo.
SubProceso  eleccion(balance, momento,num,num1,deuda Por Referencia,pagar,pagando,logLuz Por Referencia,logAgua Por Referencia,logGas Por Referencia,logInternet Por Referencia,logCable Por Referencia,logStreamming Por Referencia)//Par�metros.
	Repetir//Desde eleccion se realiza el grueso del trabajo. Contiene un submen� y las operaciones aritm�ticas.
	mostrarCuenta(balance);
	separar();
	Escribir "Su deuda es de $",deuda;//Se manifiesta la cantidad de deuda que se definio en el primer SubProceso (es un valor aleatorio)
	separar();
	Escribir "�Qu� desea hacer?";//Submen� de 3 opciones, que da m�s libertad para actuar, adem�s de dar la posibilidad de volver.
	Escribir  " 1 - Pagar deuda completa";
	Escribir  " 2 - Pago parcial";
	Escribir  " 3 - Volver";
	Leer num1;
	si num1 = 1 Entonces
		Si deuda es mayor que balance Entonces
			Escribir "No tienes suficiente dinero para pagar este monto"
		SiNo
			balance <- balance - deuda;
			deuda <- 0;
		FinSi
		
		si (deuda <= 0) Entonces
			Segun num Hacer
				1: logLuz <- Verdadero;
				2: logAgua <- Verdadero;
				3: logGas <- Verdadero;
				4: logInternet <- Verdadero;
				5: logCable <- Verdadero;
				6: logStreamming <- Verdadero;
			FinSegun
		FinSi
		
		
	SiNo
		si num1 = 2 Entonces
			Escribir Sin Saltar " - Ingrese el monto a pagar: $";
			Leer pagar;
			
			Si pagar es mayor que balance Entonces
				Escribir "No tienes suficiente dinero para pagar este monto"
			SiNo
				pagando <- deuda - pagar;
				balance <- balance - pagando;
				separar();
				Escribir "    - Su deuda ha quedado en $",pagando, " - ";//En esta opci�n el usuario podr� ingresar montos de forma libre
				//que se restar�n a la deuda paulativamente hasta que deuda sea 0 y pueda ingresar al si de las variables l�gicas.
			FinSi
			separar();
			deuda <- pagando;
			si (deuda <= 0) Entonces
				Segun num Hacer//Como se trabaja con num1 en esta secci�n, num, a secas,siguie conteniendo el valor ingresado cuando
						//se eligi� el servicio a pagar. Por eso puedo usar esa variable para modificar una variable a la vez, dependiendo
						//de la opci�n que se elija para pagar. Importante decir que es de SUMA IMPORTANCIA PONER LOS PARAMETROS COMO REFERENCIA
						//(Estuve horas para recordar que eso exist�a...)
					1: logLuz <- Verdadero;
					2: logAgua <- Verdadero;
					3: logGas <- Verdadero;
					4: logInternet <- Verdadero;
					5: logCable <- Verdadero;
					6: logStreamming <- Verdadero;
				FinSegun
			FinSi
		FinSi
		
	FinSi
Hasta Que (num1 = 3) o (deuda <= 0);//Condicion del Repetir hasta que.
momento1(momento);
pagoDeServicios(balance);
FinSubProceso

Funcion momento1(momento)//Hice este subproceso para no escribir de m�s, ni ocupar l�neas de m�s. Ser�a lo mismo pegarlo al final de cada uno, pero de esta
	//forma puedo modificar la est�tica de forma global en vez de mejorarla puntualmente en cada lugar donde lo necesite.
	Escribir "        PRESIONE ENTER PARA CONTINUAR";
	Leer momento;
FinFuncion



SubProceso pagoDeServicios (balance)//Este subproceso es el pilar principal del pago de servicios. Este es el proceso que se llama en el men�.
	//dado que este es el que invoca todos los dem�s.
	Definir num,num1 como entero;//num ser� el n�mero de elecci�n de servicio, mientras que num1 ser� el del men� dentro del servicio
	Definir deuda,pagar,pagando como real;//deuda y pagar ser�n los n�meros que se trabajen mientras que pagando ser� la variable
	//que contenga el resultado.
	Definir servicio,momento como cadena;//Serivicio tiene la �nica finalidad de dar otra libertad al usuario al poder ingresar un
	//servicio no contemplado, aunque no podr� pagarlo. momento es simplemente una pausa entre resultado del proceso y la vuelta al men�.
	Definir logLuz,logAgua,logGas,logInternet,logCable,logStreamming Como Logico;//Las variables l�gicas de cada servicio son creadas
	//para que no pueda pagarse dos veces el mismo servicio una vez que se ha pagado en su totalidad. Tristemente no he encontrado a�n una
	//forma simple en que al elegir "pago parcial" y presionando "volver" la ecuaci�n resultante se guarde al volver a ingresar. La deuda
	//se reinicia al hacer esto. Sin embargo, si deuda llega a 0 ya no puede volver a ingresar para realizar el pago, quedando la deuda
	//en 0 con respecto a ese servicio.
	logAgua <- Falso;
	logCable <- Falso;
	logGas <- Falso;
	logInternet <- Falso;
	logLuz <- Falso;
	logStreamming <- Falso;
	deuda <- azar(9999.99);//Decid� poner el valor de deuda en aleatorio, me parece que ofrece m�s dinamismo a la aplicaci�n.
	momento <- "";
	Repetir
		mostrarCuenta(balance);
		Escribir "";//A�ad� espacios por razones de est�tica. La idea es que se asemeje un poco a la interfaz de homebanking.
		Escribir Sin Saltar "     - Pulse el n�mero del servicio que desea pagar -";
		Escribir "";
		Escribir "";
		escribir " 1 - LUZ                                    4 - INTERNET";
		Escribir " 2 - AGUA                                   5 - CABLE";
		escribir " 3 - GAS                                    6 - STREAMING";
		escribir " ";
		Escribir "                     7 - VOLVER";
		Leer num;
		pagar <- 0;
		pagando <- 0;//Inicializo en 0 estas variables dentro de repetir para evitar cualquier problema. De esta forma, cada vez que se paga
		//se reinician estos valores.
		Escribir "";
		separar();
		Escribir "";
		Segun num Hacer
			1:	si logLuz = Falso Entonces//Este segmento de c�digo se ejecuta mientras la variable l�gica sea falsa.
					//La variable se vuelve verdadera en el SubProceso elecci�n, que devuelve argumentos por referencia.
					escribir "           HA ELEGIDO PAGAR LA LUZ";
					Escribir "";
					Escribir "Diga que empresa le provee el servicio el�ctrico";
					escribir "1 - EDEMSA";//Las primeras 3 opciones invocan al suproceso eleccion.
					escribir "2 - EDESUR";
					escribir "3 - EDENOR";
					escribir "4 - Otro";//Esta opci�n permite ingresar libremente una cadena, sin embargo esta no se trabaja.
					Escribir "5 - VOLVER";//Opci�n de volver al men� anterior. Opci�n vac�a.
					
					Leer num1;//Variable que determina el segundo men�. En el SubProceso eleccion se explica la necesidad de dos 
					//variables num.
					
					Segun num1 Hacer
						
						1: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);//Argumentos.
							//Invoca SubProceso.
							
						2: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						3: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						4: 
							Escribir "Ingrese el Servicio que desea pagar";
							Leer servicio;
							separar();
							Escribir "Lo lamentamos, pero ",servicio, " no puede ser pagado desde esta plataforma";
							separar();
							momento1(momento);//Pausa antes de volver al men�.
							
					FinSegun
				SiNo
					separar();
					Escribir "Su deuda de luz esta PAGADA, usted NO TIENE DEUDA";//Si la deuda ha sido pagada, entonces no se permite entrar
					//nuevamente a pagar.
					separar();
					momento1(momento);//pausa.
				FinSi
				
				
			2:	si logAgua = Falso Entonces//REPITE PRINCIPIOS APLICADOS EN LUZ.
					escribir "          HA ELEGIDO PAGAR EL AGUA";
					Escribir "Diga que empresa le provee el servicio de agua";
					escribir "1 - AYSAM";
					escribir "2 - AYSA";
					escribir "3 - SAPEM";
					escribir "4 - Otro";
					Escribir "5 - VOLVER";
					deuda <- azar(9999.99);
					Leer num1;
					Segun num1 Hacer
						1: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
							
						2: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						3: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						4: 
							Escribir "Ingrese el Servicio que desea pagar";
							Leer servicio;
							separar();
							Escribir "Lo lamentamos, pero ",servicio, " no puede ser pagado desde esta plataforma";
							separar();
							momento1(momento);
					FinSegun
				SiNo
					separar();
					Escribir "Su deuda de agua esta PAGADA, usted NO TIENE DEUDA";
					separar();
					momento1(momento);
				FinSi
				
				
			3: si logGas = Falso Entonces//REPITE PRINCIPIOS APLICADOS EN LUZ.
					escribir "           HA ELEGIDO PAGAR EL GAS";
					Escribir "Diga que empresa le provee el servicio de gas natural";
					escribir "1 - ECOGAS";
					escribir "2 - CAMUZZI GAS PAMPEANO Y CAMUZZI GAS DEL SUR";
					escribir "3 - EDENOR";
					escribir "4 - Otro";
					Escribir "5 - VOLVER";
					deuda <- azar(9999.99);
					Leer num1;
					Segun num1 Hacer
						1: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
							
						2: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						3: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						4: 
							Escribir "Ingrese el Servicio que desea pagar";
							Leer servicio;
							separar();
							Escribir "Lo lamentamos, pero ",servicio, " no puede ser pagado desde esta plataforma";
							separar();
							momento1(momento);
							
					FinSegun
				SiNo
					separar();
					Escribir "Su deuda de gas esta PAGADA, usted NO TIENE DEUDA";
					separar();
					momento1(momento);
				FinSi
				
			4:	si logInternet = Falso Entonces//REPITE PRINCIPIOS APLICADOS EN LUZ.
					escribir "         HA ELEGIDO PAGAR INTERNET";
					Escribir "Diga que empresa proveedora de internet utiliza";
					escribir "1 - CLARO";
					escribir "2 - MOVISTAR";
					escribir "3 - FIERTEL";
					escribir "4 - Otro";
					Escribir "5 - VOLVER";
					deuda <- azar(9999.99);
					Leer num1;
					Segun num1 Hacer
						1: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
							
						2: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						3: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						4: 
							Escribir "Ingrese el Servicio que desea pagar";
							Leer servicio;
							separar();
							Escribir "Lo lamentamos, pero ",servicio, " no puede ser pagado desde esta plataforma";
							separar();
							momento1(momento);
							
					FinSegun
					
				SiNo
					separar();
					Escribir "Su deuda de internet esta PAGADA, usted NO TIENE DEUDA";
					separar();
					momento1(momento);
				FinSi
				
				
			5:  si logInternet = Falso Entonces//REPITE PRINCIPIOS APLICADOS EN LUZ.
					escribir "         HA ELEGIDO PAGAR EL CABLE";
					Escribir "Diga que empresa le provee sus canales de cable";
					escribir "1 - SUPERCANAL";
					escribir "2 - DIRECTV";
					escribir "3 - CABLECANAL";
					escribir "4 - Otro";
					Escribir "5 - VOLVER";
					deuda <- azar(9999.99);
					Leer num1;
					Segun num1 Hacer
						1: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
							
						2: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						3: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						4: 
							Escribir "Ingrese el Servicio que desea pagar";
							Leer servicio;
							separar();
							Escribir "Lo lamentamos, pero ",servicio, " no puede ser pagado desde esta plataforma";
							separar();
							momento1(momento);
							
					FinSegun
				SiNo
					separar();
					Escribir "Su deuda de internet esta PAGADA, usted NO TIENE DEUDA";
					separar();
					momento1(momento);
				FinSi
				
			6:  si logInternet = Falso Entonces//REPITE PRINCIPIOS APLICADOS EN LUZ.
					escribir "    HA ELEGIDO PAGAR SU SERVICIO DE STREAMING";
					Escribir "Diga que empresa le provee el servicio Streaming";
					escribir "1 - NETFLIX";
					escribir "2 - AMAZON PRIME";
					escribir "3 - DISNEY +";
					escribir "4 - Otro";
					Escribir "5 - VOLVER";
					deuda <- azar(9999.99);
					Leer num1;
					Segun num1 Hacer
						1: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
							
						2: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						3: 
							eleccion(balance, momento,num,num1,deuda,pagar,pagando,logLuz,logAgua,logGas,logInternet,logCable,logStreamming);
						4: 
							Escribir "Ingrese el Servicio que desea pagar";
							Leer servicio;
							separar();
							Escribir "Lo lamentamos, pero ",servicio, " no puede ser pagado desde esta plataforma";
							separar();
							momento1(momento);
					FinSegun
				SiNo
					separar();
					Escribir "Su deuda de servicios de streamming esta PAGADA, usted NO TIENE DEUDA";
					separar();
					momento1(momento);
				FinSi
			7: 
				Limpiar Pantalla;
				mostrarMenuPrincipal(balance);
		FinSegun
	Hasta Que num = 7;//El men� principal se repetir� hasta que el usuario presione 7.
FinSubProceso
