package model

class RespuestaException extends Exception {
	
	new(){
		super("Campos obligatorios incompletos")
	}
}