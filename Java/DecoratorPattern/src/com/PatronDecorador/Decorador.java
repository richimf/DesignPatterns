package com.PatronDecorador;
/*
    Siempre se heredara de la Clase Combo, ya que los combos usaran el mismo decorador
 */
public abstract class Decorador extends Combo{

    //recordamos que Combo ya tiene definida la funcion getDescripcion(),
    //asi obtendremos la descripcion del Combo, usando una funcion en el Decorador con el mismo nombre
    public abstract String getDescripcion(); //cada decorador que herede de esta clase abstracta se implementara diferente
}
