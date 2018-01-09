# DESIGN PATTERNS #

### CATEGORIAS ###

* STRUCTURAL: Como componer objetos.
  - Adapter, Facade

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

Otro ejemplo de uso es en Android, un [Adapter](https://github.com/richimf/TutosAndroid/blob/master/RecyclerViewTuto/app/src/main/java/com/example/ricardomontesinos/recyclerviewtuto/RecyclerAdapter.java) es muy utilizado en RecyclerViews.


#### FACADE ####

Es una manera de hacer que un subsistema complejo se vuelva simple utilizando una interfaz de alto nivel.
Este patrón es ideal cuando se trabajan con muchas clases y estas son muy complejas o dificiles de entender. Por otro lado, Facade es la única via de acceso al subsistema. Un Facade bien hecho debe ser simple y debe facilitar las cosas, no debe ser complejo.

* Ejemplo en Java:
Creamos una interfaz:
```Java
public interface Shape {
   void draw();
}
```

Creamos clases que implementen esta interfaz:
```Java
public class Rectangle implements Shape {

   @Override
   public void draw() {
      System.out.println("Rectangle::draw()");
   }
}

public class Square implements Shape {

   @Override
   public void draw() {
      System.out.println("Square::draw()");
   }
}

public class Circle implements Shape {

   @Override
   public void draw() {
      System.out.println("Circle::draw()");
   }
}
```

Creamos una clase Facade:
```Java
public class ShapeMaker {
   private Shape circle;
   private Shape rectangle;
   private Shape square;

   public ShapeMaker() {
      circle = new Circle();
      rectangle = new Rectangle();
      square = new Square();
   }

   public void drawCircle(){
      circle.draw();
   }
   public void drawRectangle(){
      rectangle.draw();
   }
   public void drawSquare(){
      square.draw();
   }
}
```

Implementamos el Facade:
```Java
public class FacadePatternDemo {
   public static void main(String[] args) {
      ShapeMaker shapeMaker = new ShapeMaker();
      shapeMaker.drawCircle();
      shapeMaker.drawRectangle();
      shapeMaker.drawSquare();      
   }
}
```

* Ejemplo en Swift:
>Supongamos que tenemos dos sistemas llamados "PersistencyManager" (un sistema local) y "HTTPClient" (un servidor).
Estos sistemas tienen una lógica muy compleja, la cuál a nuestra App no le interesa.
Ahora, para implementar el patrón Facade usaremos un intermediario, lo llamaremos "LibraryAPI" la cuál tendra instancias de "PersistencyManager" y de "HTTPClient".
"LibraryAPI" a la vez ocultará a los dos sistemas de la App. El siguiente ejemplo crea una clase de Swift la cuál solo debemos utilizar para hacer la comunicación con ambos sistemas.

```Swift
//Inside  LibraryAPI.swift we create instances of the systems.
private let persistencyManager = PersistencyManager()
private let httpClient = HTTPClient()
private let isOnline = false

func getAlbums() -> [Album] {
  return persistencyManager.getAlbums()    
}
  
func addAlbum(_ album: Album, at index: Int) {
  //First save data locally
  persistencyManager.addAlbum(album, at: index)
  //If there is internet connection, upload it to the server
  if isOnline {
    httpClient.postRequest("/api/addAlbum", body: album.description)
  }  
}
  
func deleteAlbum(at index: Int) {
  persistencyManager.deleteAlbum(at: index)
  if isOnline {
    httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
  }   
}

```

* Ejemplo en Android:
>Supongamos que en un Activity necesitamos una lista de libros, deberiamos ser capacez de preguntarle a un objeto por ellos sin importarnos como obtenemos la información. Por lo tanto, podemos cambiar el codigo del API que alimenta la lista de libros sin modificar nuestro Activity. Ambos deben ser independientes. Un ejemplo de uso de Facade es [Retrofit](http://square.github.io/retrofit/).

```Kotlin
//Retrofit example.
//The client simply needs to call listBooks() to receive a list of Book objects.
interface BooksApi {
  @GET("books")
  fun listBooks(): Call<List<Book>>
}
```































