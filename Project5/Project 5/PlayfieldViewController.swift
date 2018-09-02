//
//  PlayfieldView.swift
//  Project 5
//
//  Created by GRIGORIAN LILIT on 15/07/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import Foundation
import UIKit

class PlayfieldViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    var images2: [UIImage] = []
    var images: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.dataSource = self
//        collectionView.delegate = self
    //    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/3)
        //Do any additional setup after loading the view, typically from a nib
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func collectionView(_ collectionVew: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     //   if collectionVew.tag == 0 
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.smallImageView.image = images[indexPath.item]
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.5
        
        
        return cell
    }
    
    
    func collectionView(_collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.yellow.cgColor
        cell?.layer.borderWidth = 2
    }
    
    func collectionView(_collectionView: UICollectionView, didDeSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.yellow.cgColor
        cell?.layer.borderWidth = 0.5
        
    }
    
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }

    
    @IBOutlet weak var newGame: UIButton!
    
    
}





