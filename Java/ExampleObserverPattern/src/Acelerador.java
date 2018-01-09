import java.util.ArrayList;

public class Acelerador implements SujetoObservable {

    //Enlazar el motor con el acelerador, ya que es una relacion 1:N
    private ArrayList<Observador> observadores;

    //Constructor
    public Acelerador() {
        this.observadores = new ArrayList<>();
    }

    public void pisarElAcelerador(){
        notificar();
    }

    public void enlazarObservador(Observador o){
        observadores.add(o);
    }

    @Override
    public void notificar() {
        //Recorremos todos los observadores
        for (Observador o : observadores) {
             o.update();
        }
    }
}
