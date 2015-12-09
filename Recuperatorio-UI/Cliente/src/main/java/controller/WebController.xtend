package controller

import model.Respuesta
import model.RespuestaException
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repository.CarreraRepository
import repository.EncuestaRepository

@Controller
class WebController {

extension JSONUtils = new JSONUtils
	
	@Get ('/carreras')
	def Result carreras (){
		val carreras = new CarreraRepository().carreras.clone
		response.contentType = ContentType.APPLICATION_JSON
		ok (carreras.toJson)
	}

	@Get ('/turnos')
	def Result turnos (){
		val turnos = new CarreraRepository().turnos.clone
		response . contentType = ContentType . APPLICATION_JSON
		ok(turnos.toJson)
	}
	
	@Get ('/carrera')
	def Result carrera (){
		val carrera = new CarreraRepository().carrera01
		response . contentType = ContentType . APPLICATION_JSON
		ok(carrera.toJson)
	}
	
	@Get ('/respuestas')
	def Result respuestas (){
		val respuestas = new EncuestaRepository().respuestas
		response . contentType = ContentType . APPLICATION_JSON
		ok(respuestas.toJson)
	}
	
	@Post('/respond')
    def Result agregarRespuesta(@Body String body) {
    	try {
	    	var nuevaRespuesta = body.fromJson(Respuesta)
	    	nuevaRespuesta.validar
	    	val respuestas = new EncuestaRepository().respuestas
	    	respuestas.add(new Respuesta(nuevaRespuesta.carrera,nuevaRespuesta.anioIngreso,nuevaRespuesta.finalesAprobados,nuevaRespuesta.finalesDesaprobados,nuevaRespuesta.cursadasAprobadas,nuevaRespuesta.mailDelEncuestado,nuevaRespuesta.materiasACursar))
	    	ok()
    	}
    	catch (RespuestaException e) {
    		throw new RespuestaException() 
    	}
    }

	def static void main ( String [] args ) {
	XTRest . start ( WebController , 8000)
	}
}