# DESIGN PATTERNS #

### CATEGORIAS ###

* CREATIONAL: Como crear objetos.
  - Builder, Dependency Injection, Singleton

* STRUCTURAL: Como componer objetos.
  - Adapter, Facade

* BEHAVIORAL: Como coordinar interacciones entre objetos.
  -Command, Observer, Model View Controller, Model View ViewModel, Clean Architecture

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














