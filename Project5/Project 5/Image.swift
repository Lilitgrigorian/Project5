//
//  Image.swift
//  Project 5
//
//  Created by GRIGORIAN LILIT on 10/08/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import UIKit

extension UIImage {
    func imageByCropToRect(rect:CGRect, scale:Bool) -> UIImage {
        
        var rect = rect
        var scaleFactor: CGFloat = 1.0
        if scale  {
            scaleFactor = self.scale
            rect.origin.x *= scaleFactor
            rect.origin.y *= scaleFactor
            rect.size.width *= scaleFactor
            rect.size.height *= scaleFactor
        }
        
        var image: UIImage? = nil;
        if rect.size.width > 0 && rect.size.height > 0 {
            let imageRef = self.cgImage!.cropping(to: rect)
            image = UIImage(cgImage: imageRef!, scale: scaleFactor, orientation: self.imageOrientation)
        }
        
        return image!
    }
}
