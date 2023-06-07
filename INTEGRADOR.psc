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
	Escribir Sin Saltar "Olvide mi contraseña ";
	
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
	
	Escribir "Bienvenido al HomeBanking de la UTN-SR";
	Escribir usuario;
	Escribir "Dinero: ", balance;
	mostrarMenu();
FinProceso

Funcion mostrarMenu() 
	Escribir "Menu";
FinFuncion
	