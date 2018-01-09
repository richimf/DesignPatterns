public class Main {

    //Ejemplo de patron de diseño Observador
    public static void main(String[] args){

        // El motor observa al objeto Acelerador,
        // Cuando se pisa el Acelerador el Motor comienza a funcionar.
        // Acelerador: Sujeto Observable
        // Motor,Luces: Observadores

        Motor m = new Motor();
        Luces l = new Luces();
        Acelerador a = new Acelerador();

        a.enlazarObservador(m);
        a.enlazarObservador(l);

        a.pisarElAcelerador(); //notificar()

    }

}
