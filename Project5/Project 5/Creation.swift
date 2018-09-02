//
//  Creation.swift
//  Project 5
//
//  Created by GRIGORIAN LILIT on 07/06/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//


import Foundation
import UIKit

class Creation {
    var image: UIImage
    var colorSwatch: ColorSwatch
    
    static var defaultImage: UIImage {
        return UIImage.init(named: "butterfly")!
    }
    
    static var defaultColorSwatch: ColorSwatch {
        return ColorSwatch.init(caption: "Simply Green", color: .green)
    }
    
    init() {
        // stored property initialization
        image = Creation.defaultImage
        colorSwatch = Creation.defaultColorSwatch
    }
    
    convenience init(colorSwatch: ColorSwatch?) {
        self.init()
        // stored property initialization
        if let userColorSwatch = colorSwatch {
            self.colorSwatch = userColorSwatch
        }
    }
    
    func reset(colorSwatch: ColorSwatch?) {
        image = Creation.defaultImage
        if let userColorSwatch = colorSwatch {
            self.colorSwatch = userColorSwatch
        }
        else {
            self.colorSwatch = Creation.defaultColorSwatch
        }
    }
}
