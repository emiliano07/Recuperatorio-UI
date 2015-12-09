package repository

import java.util.List
import model.Carrera
import model.Materia
import model.Turno
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CarreraRepository {
	List<Carrera> carreras
	List<Turno> turnos
	Carrera carrera01
	Materia materia01
	Materia materia02
	
	new () {
		carrera01 = new Carrera("Licenciatura en Informatica")
		materia01 = new Materia("Interfases", Turno.NOCHE)
		materia02 = new Materia("Programacion Concurrente", Turno.TARDE)
		
		carrera01.materias = #[materia01,materia02]
		carreras = #[carrera01]
		turnos = #[Turno.MANIANA,Turno.TARDE,Turno.NOCHE]
	}
}