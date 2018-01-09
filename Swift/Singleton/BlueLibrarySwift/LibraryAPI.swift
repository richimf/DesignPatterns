//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by Ricardo Montesinos Fernandez on 11/28/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    //1.- la primera vez que el cliente pregunta por el "sharedInstance",
    //    el "instance" property aun no esta inicializado.
    //Esta variable de clase puede ser llamada sin tener que instanciar la clase LibraryAPI.
    class var sharedInstance: LibraryAPI {
        
        //2
        struct Singleton {
            //3.- Singleton, declarando la variable como "static", significa que SOLO existirá UNA vez.
            //    los tipos static se crean solo cuando son utilizados
            static let instance = LibraryAPI()
        }
        //4
        return Singleton.instance
    }
}

//Hay diferentes formas de crear un Singleton en Swift, aqui mencionaremos tres.
// A.- Class constant
/*
    Esta implementacion es THREAD SAFE por la definicion de let.
 */
class SingletonA {
    
    static let sharedInstance = SingletonA()
    
    init() {
        print("AAA");
    }
}

// B.- Nested Struct
/*
    Utilizaremos una constante 'static' dentro de una estructura anidada, todo esto como una variable de clase.
    Esta es una solucion alternativa (workaround) para la ausencia (lack) de static constants and variables in functions.
 */
class SingletonB {
    //class variable
    class var sharedInstance: SingletonB {
        //nested struct
        struct Static {
            //'static' constant
            static let instance: SingletonB = SingletonB()
        }
        return Static.instance
    }
}

// C.- dispatch_once
/*
    Singleton al estilo de Objective-C
 */
/*
class SingletonC {
    
    class var sharedInstance: SingletonC {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: SingletonC? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SingletonC()
        }
        return Static.instance!
    }
}*/










