public class Luces implements Observador {

    @Override
    public void update() {
            System.out.println("Hemos sido notificados, Encendemos Luces");
    }
}
