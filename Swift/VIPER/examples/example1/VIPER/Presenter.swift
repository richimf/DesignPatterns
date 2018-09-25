//
//  Presenter.swift
//  VIPER
//
//  Created by Richie on 8/26/18.
//  Copyright © 2018 Richie. All rights reserved.
//

import Foundation
import UIKit

/*El Presenter contiene una referencia a la vista para que esta pueda cargar los datos que le pasemos,
 otra a nuestro Interactor que es el que vamos a pedirle la información solicitada por los eventos del usuario y
 otra a nuestro Routing para cuando tengamos que navegar a otra pantalla.*/

class Presenter {
    
    var view:TableViewController?
    var interactor:Interactor?
    var routing:Routing?
    
    init(){
        
    }
    
    func addNewObject(){
        
    }

}
