# DESIGN PATTERNS #

### CATEGORIAS ###

* BEHAVIORAL: Como coordinar interacciones entre objetos.
  -Command, Observer, Model View Controller, Model View ViewModel, Clean Architecture

### BEHAVIORAL ###
#### OBSERVER ####
El patron observador es usado cuando hay una relacion 1-N uno a muchos entre objetos, entonces, si un objeto es modificado, los demas objetos relacionados serán notificados automáticamente. 
Este patrón usa tres componentes: Subject, Observers y Client. 

```Java
public abstract class Observer {
   protected Subject subject;  ///<-----
   public abstract void update();
}
```

Nuestro Subject sera el encargado de gestionar las notificaciones.
```Java
public class Subject {
	
   private List<Observer> observers = new ArrayList<Observer>();
   private int state;

   public int getState() {
      return state;
   }

   public void setState(int state) {
      this.state = state;
      notifyAllObservers();
   }

   public void attach(Observer observer){
      observers.add(observer);		
   }

   public void notifyAllObservers(){
      for (Observer observer : observers) {
         observer.update();
      }
   } 	
}
```

Implementando los Observers, deben heredar de la clase Observer.
```Java
public class BinaryObserver extends Observer{

   public BinaryObserver(Subject subject){
      this.subject = subject;
      this.subject.attach(this);
   }

   @Override
   public void update() {
      System.out.println( "Binary String: " + Integer.toBinaryString(subject.getState()) ); 
   }
}

public class OctalObserver extends Observer{

   public OctalObserver(Subject subject){
      this.subject = subject;
      this.subject.attach(this);
   }

   @Override
   public void update() {
     System.out.println( "Octal String: " + Integer.toOctalString(subject.getState()) ); 
   }
}
```

```Java
public class ObserverPatternDemo {
   public static void main(String[] args) {
      Subject subject = new Subject();

      new OctalObserver(subject);
      new BinaryObserver(subject);

      System.out.println("First state change: 15");	
      subject.setState(15);

      System.out.println("Second state change: 10");	
      subject.setState(10);
   }
}
```

>La salida seria:
```
First state change: 15
Octal String: 17
Binary String: 1111

Second state change: 10
Octal String: 12
Binary String: 1010
```










