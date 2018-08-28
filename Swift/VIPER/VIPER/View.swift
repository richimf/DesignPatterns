//
//  View.swift
//  VIPER
//
//  Created by Richie on 8/26/18.
//  Copyright © 2018 Richie. All rights reserved.
//

import Foundation

//Un protocolo que va a adoptar nuestro controlador de vista para responder a los eventos generados por el usuario
// Esta funcion recibe los objetos que nos pasa el Presenter:

protocol viewProtocol {
    func setListWithObjects(objects:[String])
}
