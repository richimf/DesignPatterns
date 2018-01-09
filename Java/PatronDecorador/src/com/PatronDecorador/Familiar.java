package com.PatronDecorador;

/*
 * Created by richie on 11/6/16.
 */
public class Familiar extends Combo {

    public Familiar() { //al crear nuestro objeto Familiar(), se pone esta descripcion por defecto al nivel de la superclase Combo
        descripcion = "Combo Familiar, hamburguesa familiar y refresco";
    }

    //Usamos el metodo de la clase abstracta
    @Override
    public int valor() {
        return 70;
    }
}

