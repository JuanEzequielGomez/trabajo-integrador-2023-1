Proceso homeBanking
	Definir usuario,nUsuario Como Caracter;
	Definir contrasena,contra Como Entero;
	Definir opcion Como Entero;
	usuario <- 'HENIVAEM';
	contrasena <- 1234;
	Repetir
		Escribir 'Ingrese su nombre de usuario: ';
		Leer nUsuario;
		Escribir 'Ingrese su contraeña: ';
		Leer contra;
		Si nUsuario=usuario Y contra=contrasena Entonces
			Escribir 'Los datos son correctos';
		SiNo
			Escribir 'Los datos son incorrectos';
		FinSi
	Hasta Que nUsuario=usuario Y contra=contrasena
	Escribir "";
	Escribir '----------------------MENU----------------------';
	Escribir '1. Últimos movimientos';
	Escribir '2. Saldo';
	Escribir '3. Pago de servicios';
	Escribir '4. Transferencias';
	Leer opcion;
	Segun opcion Hacer
		4:
			datos();
		De Otro Modo:
			Escribir "Se equivoco de opcion de menu";
	FinSegun
FinProceso

SubProceso datos()
	Definir opcion,cbu,dinero Como Entero;
	Definir alias,contacto Como Caracter;
	Repetir
		Escribir "";
		Escribir "Elige una opcion";
		Escribir "1. Nueva transferencia ";
		Escribir "2. Contactos agendados ";
		Leer opcion;
		Segun opcion Hacer
			1:
				Escribir "";
				Escribir "1. Ingresar CBU";
				Escribir "2. Ingresar Alias";
				Leer opcion;
				Segun opcion Hacer
					1:
						Escribir "";
						Escribir Sin saltar "CBU: ";
						Leer cbu;
						Escribir sin saltar "Ingrese el monto a transferir: ";
						Leer dinero;
						Escribir "¡¡¡La transferencia realizada a ",cbu," con un monto de ",dinero," fue exitosa!!!";
					2:
						Escribir "";
						Escribir Sin saltar "Alias: ";
						Leer alias;
						Escribir sin saltar "Ingrese el monto a transferir: ";
						Leer dinero;
						Escribir "¡¡¡La transferencia realizada a ",alias," con un monto de ",dinero," fue exitosa!!!";
					De Otro Modo:
						Escribir "OPCION INCORRECTA";
						Escribir "";
				FinSegun
			2: 
				Escribir "";
				Escribir "CONTACTOS";
				Escribir "Gomez Alejandro";
				Escribir "Gomez Ezequiel";
				Escribir "Grossi Emiliano";
				Escribir "Guizada Ivan";
				Escribir "Paidican Nicol";
				Escribir "Vega Hernan";
			    Escribir "";
				Escribir Sin Saltar "Escriba el nombre del contacto: "; 
				Leer contacto;
				Escribir Sin Saltar "Ingrese el monto a transferir: ";
				Leer dinero;
				Escribir "¡¡¡",contacto," recibio una transferencia de ",dinero," exitosamente!!!";
		FinSegun
	Hasta Que opcion>0 y opcion<3
FinSubAlgoritmo
