//
//  ImageEditorViewController.swift
//  Project 5
//
//  Created by GRIGORIAN LILIT on 17/06/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import UIKit


class ImageEditorViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func start(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartAction" {
            if let vc = segue.destination as? PlayfieldViewController {
                let squareSize = imageView.frame.width - 40
                let tileSize = squareSize/2
                if var image = creation?.image {
                    image = UIImage( cgImage: image.cgImage!.cropping(to: CGRect(x: 140, y: 270, width: squareSize, height: squareSize))!) // need to chnage x and y
                    if let images = cropImage(image: image, tileSize: Int(tileSize)) { // navigate to the third view
                        vc.images = images
                    }
                }
            }
        }
    }
    
    
    func cropImage(image: UIImage, tileSize: Int) -> [UIImage]? {
        let hCount = Int(image.size.height) / tileSize
        let wCount = Int(image.size.width) / tileSize
        
        var tiles:[UIImage] = []
        
        for i in 0...hCount-1 {
            for p in 0...wCount-1 {
                let rect = CGRect(x: p*tileSize, y: i*tileSize, width: tileSize, height: tileSize)
                let temp:CGImage = image.cgImage!.cropping(to: rect)!
                tiles.append(UIImage(cgImage: temp))
            }
        }
        return tiles
    }
    
    //    var path: UIBezierPath!
    //
    //    func createRectangle() {
    //        // Initialize the path.
    //        path = UIBezierPath()
    //
    //        // Specify the point that the path should start get drawn.
    //        path.move(to: CGPoint(x: 20.0, y: 15.0))
    //
    //        // Create a line between the starting point and the bottom-left side of the view.
    //        path.addLine(to: CGPoint(x: 20.0, y: view.frame.size.height))
    //
    //        // Create the bottom line (bottom-left to bottom-right).
    //        path.addLine(to: CGPoint(x: view.frame.size.width, y: view.frame.size.height))
    //
    //        // Create the vertical line from the bottom-right to the top-right side.
    //        path.addLine(to: CGPoint(x: view.frame.size.width, y: 15.0))
    //
    //        // Close the path. This will create the last line automatically.
    //        path.close()
    //    }
    
    
    //    let redView = UIView(frame: CGRect(x: 50, y: 50, width: 128, height: 128))
    ////    redView.backgroundColor = .red
    //    view.addSubview(redView)
    //
    //    let maskView = UIView(frame: CGRect(x: 64, y: 0, width: 128, height: 128))
    ////    maskView.backgroundColor = .blue
    ////    maskView.layer.cornerRadius = 64
    //    redView.mask = maskView
    
    
    //    func draw(_ rect: CGRect) {
    //        self.createRectangle()
    //
    //        // Specify the fill color and apply it to the path.
    //        UIColor.orange.setFill()
    //        path.fill()
    //
    //        // Specify a border (stroke) color.
    //        UIColor.purple.setStroke()
    //        path.stroke()
    //    }
    
    
    
    var creation: Creation?
    
    override func viewDidLoad() {
        imageView.image = creation?.image
        
        
    }
}
