//
//  AlbumView.swift
//  BlueLibrarySwift
//
//  Created by Ricardo Montesinos Fernandez on 11/28/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

import UIKit
// En el patron de diseño MVC, la Vista: Los objetos que estan a cargo de mostrar visualmente al Modelo.
/**
 Esta clase seria tu Vista.
 */
class AlbumView: UIView {
    
    private var coverImage: UIImageView!
    private var indicator: UIActivityIndicatorView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    init(frame: CGRect, albumCover: String) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = UIColor.black
        coverImage = UIImageView(frame: CGRect(x: 5, y: 5, width: frame.size.width - 10, height: frame.size.height - 10))
        addSubview(coverImage)
        indicator = UIActivityIndicatorView()
        indicator.center = center
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.startAnimating()
        addSubview(indicator)
    }
    
    func highlightAlbum(didHighlightView: Bool) {
        if didHighlightView == true {
            backgroundColor = UIColor.white
        } else {
            backgroundColor = UIColor.black
        }
    }
    
}
