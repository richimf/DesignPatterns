package com.PatronDecorador;

/*
 * Created by richie on 11/6/16.
 */
public abstract class Combo {

    String descripcion = ""; //ALGO muy general para todos los combos

    public String getDescripcion() {
        return descripcion;
    }

    public abstract int valor(); //todos los combos tendran un valor, pero este es diferente para cada uno.

}
