package com.PatronDecorador;

/*
 * Created by richie on 11/6/16.
 */
public class Carne extends Decorador {

    private Combo combo;

    public Carne(Combo combo) { //Para poder mejorar el Combo, usaremos el objeto como parametro
        this.combo = combo;
    }

    @Override
    public String getDescripcion() { //obtenemos el string del parametro combo, y le agregamos mas texto
        return combo.getDescripcion() + " , Porcion de Carne extra agregado";
    }

    @Override
    public int valor() {
        return 25 + combo.valor();
    }
}