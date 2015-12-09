package model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Carrera {
	
	String nombre
	List<Materia> materias
	
	
	new () {}
	
	new(String nombre){
		this.nombre=nombre
		materias = newArrayList
	}
	
	new(String nombre, List<Materia> materias){
		this.nombre = nombre
		this.materias = materias
	}
	
	def agregarMateria(Materia materia){
		materias.add(materia)
	}
}