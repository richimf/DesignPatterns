# DESIGN PATTERNS #

### CATEGORIAS ###

* [CREATIONAL](https://github.com/richimf/DesignPatterns/blob/master/README-Creational.md): Como crear objetos.
  - Builder, Dependency Injection, Singleton

* [STRUCTURAL](https://github.com/richimf/DesignPatterns/blob/master/README-Structural.md): Como componer objetos.
  - Adapter: Hace que clases incompatibles sean compatibles entre sí.
  - Facade:  Una clase que representa un subsistema completo.
  - Decorador: Permite agregar funcionalidad a un objeto sin alterar su estructura.

* [BEHAVIORAL](https://github.com/richimf/DesignPatterns/blob/master/README-Behavioral.md): Como coordinar interacciones entre objetos.
  - Command, Observer, Model View Controller, Model View ViewModel, Clean Architecture


### iOS KVC and KVO

**Key-Value-Coding (KVC)** means accessing a property or value using a string.
``` Objective-C
id someValue = [myObject valueForKeyPath:@"foo.bar.baz"];
```
Which could be the same as:
``` Objective-C
id someValue = [[[myObject foo] bar] baz];
```

**Key-Value-Observing (KVO)** allows you to observe changes to a property or value.

To observe a property using KVO you would identify to property with a string; i.e., using KVC. Therefore, the observable object must be KVC compliant.

``` Objective-C
[myObject addObserver:self forKeyPath:@"foo.bar.baz" options:0 context:NULL];
```


### REFERENCIAS ###
* Design Patterns explained simply [Source Making](https://sourcemaking.com/design_patterns)
* Design Patterns on iOS using Swift [Raywenderlich](https://www.raywenderlich.com/160651/design-patterns-ios-using-swift-part-12)
* Common Design Patterns for Android with Kotlin [Raywenderlich](https://www.raywenderlich.com/168038/common-design-patterns-android-kotlin)
* Dependency Injection [Wikipedia](https://en.wikipedia.org/wiki/Dependency_injection)
* Design Patterns [Tutorials Point](https://www.tutorialspoint.com/design_pattern/proxy_pattern.htm)








