package com.PatronDecorador;

/*
 * Created by richie on 11/6/16.
 */
public class Basico extends Combo {

    public Basico() { //al crear nuestro objeto Basico(), se pone esta descripcion por defecto al nivel de la superclase Combo
        descripcion = "Combo basico, hamburguesa simple y refresco";
    }

    //Usamos el metodo de la clase abstracta
    @Override
    public int valor() {
        return 30;
    }
}

