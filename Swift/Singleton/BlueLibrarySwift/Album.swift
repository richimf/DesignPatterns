//
//  Album.swift
//  BlueLibrarySwift
//
//  Created by Ricardo Montesinos Fernandez on 11/28/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

import UIKit
// En el patron de diseño MVC, el Modelo: El objeto que contiene los datos de tu app y define como manipularla.
/** 
 Esta clase seria tu Modelo.
 */
class Album: NSObject {
    
    var title : String!
    var artist : String!
    var genre : String!
    var coverUrl : String!
    var year : String!
    
    //initializer for Album Class
    init(title: String, artist: String, genre: String, coverUrl: String, year: String) {
        super.init()
        self.title = title
        self.artist = artist
        self.genre = genre
        self.coverUrl = coverUrl
        self.year = year
    }
    
    /*once created the Album object, you can use this var as follow:  myAlbumVar.description
    Then you will get the following output:
    title: Optional("titulo")artist: Optional("artista")genre: Optional("genero")coverUrl: Optional("url")year: Optional("ano")
    The method description() returns a string representation of the album’s attributes.  */
    override var description: String {
        return "title: \(title)" +
            "artist: \(artist)" +
            "genre: \(genre)" +
            "coverUrl: \(coverUrl)" +
	       "year: \(year)"
    }
    
}
