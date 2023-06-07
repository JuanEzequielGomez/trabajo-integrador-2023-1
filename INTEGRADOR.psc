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





Proceso Proyecto_Integrador
	Definir usuario, contrasenia Como Caracter;
	Definir cuenta Como Logico;
	Definir opc Como Entero;;
	
	cuenta <- Falso;
	Escribir "Bienvenidos al HomeBanking de la UTN-SR";
	
	Escribir "";
	Escribir "1-	Iniciar sesion ";
	Escribir "";
	Escribir "2-	Crear cuenta: ";
	Leer opc;
	Segun opc Hacer
		1:
			cuenta <- Verdadero;
		2:
			cuenta <- Falso;
			crearCuenta();
		De Otro Modo:
			Escribir "Opcion no valida, por favor ingrese una opcion correcta.";
	FinSegun
	
	
	
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
	
	
FinProceso