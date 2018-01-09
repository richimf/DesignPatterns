package com.PatronDecorador;

/*
El Patrón Decorator permite agregar funcionalidades y responsabilidades a objetos de forma dinámica y transparente para el usuario,
esto se realiza por medio de relaciones con otras clases extendiendo su funcionalidad al incorporar las de las clases asociadas,
de esta forma el patrón no es dependiente de la Herencia ya que aunque esta puede jugar un papel importante,
prevalece el uso de conceptos como la composición al momento de definir comportamientos.
*/

/*
    Con los decoradores, podemos agregar funcionalidad adicional a un objeto, recordar que el decorador debe ser
    del mismo tipo que el objeto que se va a decorar, por eso el decorador hereda de la misma Super Clase.
 */
public class Main {

    public static void main(String[] args) {

        System.out.println("========= COMBO BASICO ======");
        Combo comboBasico = new Basico(); //Creamos un combo basico
        System.out.println(comboBasico.getDescripcion());
        System.out.println("Precio = "+comboBasico.valor());

        //mejoramos nuestro combo basico, agregamos queso
        comboBasico = new Queso(comboBasico);
        System.out.println(comboBasico.getDescripcion());
        System.out.println("Precio = "+comboBasico.valor());

        //Agregamos Carne extra
        comboBasico = new Carne(comboBasico);
        System.out.println(comboBasico.getDescripcion());
        System.out.println("Precio = "+comboBasico.valor());

        //Agregamos Papas
        comboBasico = new Papas(comboBasico);
        System.out.println(comboBasico.getDescripcion());
        System.out.println("Precio = "+comboBasico.valor());



        System.out.println("========= COMBO FAMILIAR ======");

        Combo comboFamiliar = new Familiar(); //Creamos un combo basico
        System.out.println(comboFamiliar.getDescripcion());
        System.out.println("Precio = "+comboFamiliar.valor());

        //mejoramos nuestro combo familiar, agregamos queso
        comboFamiliar = new Queso(comboFamiliar);
        System.out.println(comboFamiliar.getDescripcion());
        System.out.println("Precio = "+comboFamiliar.valor());

        //Agregamos Carne extra
        comboFamiliar = new Carne(comboFamiliar);
        System.out.println(comboFamiliar.getDescripcion());
        System.out.println("Precio = "+comboFamiliar.valor());

        //Agregamos Papas
        comboFamiliar = new Papas(comboFamiliar);
        System.out.println(comboFamiliar.getDescripcion());
        System.out.println("Precio = "+comboFamiliar.valor());

    }
}
