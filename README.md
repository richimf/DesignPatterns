# DESIGN PATTERNS #

### CATEGORIAS ###

* CREATIONAL: Como crear objetos.
  - Builder, Dependency Injection, Singleton

* STRUCTURAL: Como componer objetos.
  - Adapter, Facade

* BEHAVIORAL: Como coordinar interacciones entre objetos.
  -Command, Observer, Model View Controller, Model View ViewModel, Clean Architecture

### CREATIONAL ###
#### BUILDER ####
Cuando queremos crear un objeto y poco a poco lo vamos haciendo mas complejo.
Gracias a esto, podriamos crear muchos objetos con diferentes características, evitando crear muchos constructores en una Clase.
Generalmente tiene esta estructura:

>Podemos ver que se usa repetidamente "un punto" y una "funcion()""
```java
AlertDialog.Builder(this)
  .setTitle("My title")
  .setMessage("A message")
  .show()
```

>Ejemplo de como se crea una clase usando Pattern Builder:
```java
public static class MyClassBuilder {

  private MyClassBuilder mb;

    //Constructor
    public MyClassBuilder(){
      mb = new MyClassBuilder();
    }

    //Example of method using Pattern Builder
    public MyClassBuilder setColor(Color color){
      mb.color = color;
      return this; // <---
    }

    public MyClassBuilder setValue(Int number){
      mb.value = number;
      return this; // <---
    }

    //etc...
}
```

#### DEPENDENCY INJECTION ####
La inyección de dependencias tiene que proveerte de cualquier objeto que se necesite cuando hagas una instancia de un nuevo objeto.
El nuevo objeto no necesita construir o perzonalizar los objetos.
En Android, aveces necesitamos acceder a los mismos objetos complejos desde varios lugares en la App. Se pueden inyectar estos objetos dentro de los Activities o Fragments y acceder a ellos.

>Una Inyección de Dependencias es una tecnica para inicializar una variable en lugar de explicitamente crear un servicio objeto, como se muestra:
```java
// An example without dependency injection
public class Client {
    // Internal reference to the service used by this client
    private ExampleService service;

    // Constructor
    Client() {
        // Specify a specific implementation in the constructor instead of using dependency injection
        service = new ExampleService();
    }

    // Method within this client that uses the services
    public String greet() {
        return "Hello " + service.getName();
    }
}
```

>Ahora utilizando Inyección de Dependencias:
```java
// Service setter interface.
public interface ServiceSetter {
    public void setService(Service service);
}

// Client class
public class Client implements ServiceSetter {
    // Internal reference to the service used by this client.
    private Service service;

    // Set the service that this client is to use.
    @Override
    public void setService(Service service) {
        this.service = service;
    }
}

//MAIN CLASS
public class Injector {
    public static void main(String[] args) {
        // Build the dependencies first
        Service service = new ExampleService();

        // Inject the service, constructor style
        Client client = new Client(service);

        // Use the objects
        System.out.println(client.greet());
    } 
}
```
Ver [Dragger](https://google.github.io/dagger/android.html) para Android.


#### SINGLETON ####
Consiste en crear una instancia global de una clase, asi es, solo puede haber una instancia de la clase, pero cualquiera debe poder acceder a ella.
En Kotlin usamos la palabra "object" para declarar un singleton:

```kotlin
object ExampleSingleton {
  fun exampleMethod() {
    // ...
  }
}

//We call the singleton object like this:
ExampleSingleton.exampleMethod()

//If you have to use this Kotlin Singleton from Java:
ExampleSingleton.INSTANCE.exampleMethod();
```

En Java seria de la siguiente manera:
```Java
public class Singleton {

   private static Singleton instance = null;
  
   //Constructor
   protected Singleton() {
   }

   public static Singleton getInstance() {
    //If instance is null create object otherwise return it.
      if(instance == null) {
         instance = new Singleton();
      }
      return instance;
   }
}
```

Y en Swift:

```Swift
//Final is class modifier which prevents it from being inherited or being overridden.
final class Singleton {

    static let sharedInstance = Singleton()

    //Constructor
    private init(){
    }
}
```

### STRUCTURAL ###
#### ADAPTER ####
Este patrón consiste en crear dos Clases incompatibles en compatibles, es decir, un Adapter permite que clases incompatibles trabajen juntas.

>Los Adapters hacen que las cosas funcionen después de haber sido diseñadas, pensemos en un destornillador de cruz, pero el cliente quiere uno de linea, entonces podriamos crear un adaptador.

Ejemplo sin Adapter. Una Linea y un Rectangulo son distintos e incompatibles, el usuario debe manualmente hacer que sean compatibles:

```Java
class Line {
    public void draw(int x1, int y1, int x2, int y2) {
        System.out.println("Line from point A(" + x1 + ";" + y1 + "), to point B(" + x2 + ";" + y2 + ")");
    }
}

class Rectangle {
    public void draw(int x, int y, int width, int height) {
        System.out.println("Rectangle with coordinate left-down point (" + x + ";" + y + "), width: " + width
                + ", height: " + height);
    }
}

public class NoAdapterDemo {
    public static void main(String[] args) {
        Object[] shapes = {new Line(), new Rectangle()};
        int x1 = 10, y1 = 20;
        int x2 = 30, y2 = 60;
        int width = 40, height = 40;
        for (Object shape : shapes) {
            if (shape.getClass().getSimpleName().equals("Line")) {
                ((Line)shape).draw(x1, y1, x2, y2);
            } else if (shape.getClass().getSimpleName().equals("Rectangle")) {
                ((Rectangle)shape).draw(x2, y2, width, height);
            }
        }
    }
}
```

Ahora usando un Adapter.

```Java
interface Shape {
    void draw(int x, int y, int z, int j);
}

//Reusing Rectangle and Line classes previously defined
class LineAdapter implements Shape {
    private Line adaptee;

    //Constructor
    public LineAdapter(Line line) {
        this.adaptee = line;
    }

    @Override
    public void draw(int x1, int y1, int x2, int y2) {
        adaptee.draw(x1, y1, x2, y2);
    }
}

class RectangleAdapter implements Shape {
    private Rectangle adaptee;

    //Constructor
    public RectangleAdapter(Rectangle rectangle) {
        this.adaptee = rectangle;
    }

    @Override
    public void draw(int x1, int y1, int x2, int y2) {
        int x = Math.min(x1, x2);
        int y = Math.min(y1, y2);
        int width = Math.abs(x2 - x1);
        int height = Math.abs(y2 - y1);
        adaptee.draw(x, y, width, height);
    }
}

public class AdapterDemo {
    public static void main(String[] args) {
        //Create an array of the Shape interface.
        Shape[] shapes = {new RectangleAdapter(new Rectangle()), new LineAdapter(new Line())};
        int x1 = 10, y1 = 20;
        int x2 = 30, y2 = 60;
        for (Shape shape : shapes) {
            shape.draw(x1, y1, x2, y2);
        }
    }
}
```

Entonces, un Adapter reusa las interfaces en lugar de definir nuevas, hace que estas trabajen juntas.
Dicho esto, tenemos algunas diferencias respecto a otros patrones de diseño.

  - Bridge hace que las cosas funcionen antes de ser diseñadas. El Adapter al revés, hace que funcionen después de ser diseñadas.
  - El Adapter proporciona una interfaz diferente. Proxy proporciona la misma interfaz. Decorator proporciona una interfaz mejorada. Facade define una nueva interfaz.

Otro ejemplo de uso es en Android, un Adapter es muy utilizado en RecyclerViews.










### REFERENCIAS ###
* Design Patterns explained simply [Source Making](https://sourcemaking.com/design_patterns)
* Design Patterns on iOS using Swift [Raywenderlich](https://www.raywenderlich.com/160651/design-patterns-ios-using-swift-part-12)
* Common Design Patterns for Android with Kotlin [Raywenderlich](https://www.raywenderlich.com/168038/common-design-patterns-android-kotlin)
* Dependency Injection [Wikipedia](https://en.wikipedia.org/wiki/Dependency_injection)














