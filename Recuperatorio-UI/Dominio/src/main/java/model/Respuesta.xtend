package model
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Respuesta {
	
	private Carrera carrera
	private List<Materia> materiasACursar
	private Integer anioIngreso
	private Integer finalesAprobados
	private Integer finalesDesaprobados
	private Integer cursadasAprobadas
	private String mailDelEncuestado
	
	
	new (){}
	
	new(Carrera carrera, Integer anioIngreso, Integer finalesAprobados,Integer finalesDesaprobados,Integer cursadasAprobadas,String mailDelEncuestado,List<Materia> materiasACursar){
		this.carrera = carrera
		this.anioIngreso = anioIngreso
		this.finalesAprobados = finalesAprobados
		this.finalesDesaprobados = finalesDesaprobados
		this.cursadasAprobadas = cursadasAprobadas
		this.materiasACursar = materiasACursar
		this.mailDelEncuestado = mailDelEncuestado 
	}
	
//	def private mailValido(String email) {
//		var Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
//		var Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(email);
//		matcher.find()
//	}
	
	def validar() {
		if(	carrera == null || 
			anioIngreso == null ||
			finalesAprobados == null ||
			finalesDesaprobados == null || 
			cursadasAprobadas == null
			){
			throw new RespuestaException();
		}
	}
}