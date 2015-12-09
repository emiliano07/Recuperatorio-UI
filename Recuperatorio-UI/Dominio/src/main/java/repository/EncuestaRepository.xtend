package repository

import java.util.List
import model.Carrera
import model.Materia
import model.Respuesta
import model.Turno
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EncuestaRepository {
	
	List<Respuesta> respuestas = newArrayList
	Respuesta respuesta01
	Carrera carrera01
	Materia materia01
	Materia materia02
	Materia materia03
	List<Materia> materiasACursar 
	
	new () {
		carrera01 = new Carrera("Licenciatura en Informatica")
		materia01 = new Materia("Interfases", Turno.NOCHE)
		materia02 = new Materia("Programacion Concurrente", Turno.TARDE)
		materia03 = new Materia("Estrategias de Persistencia", Turno.MANIANA)
		materiasACursar = #[materia03]
		
		carrera01.materias = #[materia01,materia02]
		
		this.respuesta01 = new Respuesta(carrera01,2099,17,1,3,"emiliano07.mp@gmail.com",materiasACursar)
		respuestas.add(respuesta01)
		
	}
	
	def Respuesta agregarRespuesta(Carrera carrera, Integer anioIngreso, Integer finalesAprobados,Integer finalesDesaprobados,Integer cursadasAprobadas,String mailDelEncuestado,List<Materia> materiasACursar) {
		var respuesta = new Respuesta(carrera,anioIngreso,finalesAprobados,finalesDesaprobados,cursadasAprobadas,mailDelEncuestado,materiasACursar)
		this.respuestas.add(respuesta)
		return respuesta
	}
	
	
}