//
//  ViewController.swift
//  Project 5
//
//  Created by GRIGORIAN LILIT on 29/05/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import UIKit
import Photos
import AVFoundation


class IntroViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var GridyButtonGeneralView: UIView!
    @IBOutlet weak var GridyButtonView: UIButton!
    @IBOutlet weak var GeneralCameraLibraryView: UIView!
    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var PhotoLibraryButton: UIButton!
    
    var creation = Creation.init()
    var localImages = [UIImage].init()
    let defaults = UserDefaults.standard
    var colorSwatches = [ColorSwatch].init()
    
    // pick local images
    @IBAction func pickExistingPictures(_ sender: UIButton) {
        
 
 processPicked(image: randomImage())
        goToEditor()

    }
    
    func randomImage() -> UIImage? {
        
        let currentImage = creation.image
        
        if localImages.count > 0 {
            while true {
                let randomIndex = Int(arc4random_uniform(UInt32(localImages.count)))
                let newImage = localImages[randomIndex]
                if newImage != currentImage {
                    return newImage
                }
            }
        }
        return nil
    }
    
    func collectLocalImageSet() {
        localImages.removeAll()
        let imageNames = ["dog", "butterfly", "birds", "horse"]
        
        for name in imageNames {
            if let image = UIImage.init(named: name) {
                localImages.append(image)
            }
        }
    }
    
    // take pictures
    @IBAction func Camera(_ sender: UIButton) {
  
        let sourceType = UIImagePickerControllerSourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            
            let noPermissionMessage = "Looks like Gridy have access to your camera:( Please use Setting app on your device to permit Gridy accessing your camera"
            
            switch status {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                    if granted {
                        self.presentImagePicker(sourceType: sourceType)
                    } else {
                        self.troubleAlert(message: noPermissionMessage)
                    }
                })
            case .authorized:
                self.presentImagePicker(sourceType: sourceType)
            case .denied, .restricted:
                self.troubleAlert(message: noPermissionMessage)
            }
        }
        else {
            troubleAlert(message: "Sincere apologies, it looks like we can't access your camera at this time")
        }
    }
    
    // pick images from photo library
    @IBAction func PhotoLibraryPictures(_ sender: UIButton) {
        
        let sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            let status = PHPhotoLibrary.authorizationStatus()
            let noPermissionMessage = "Looks like Gridy have access to your photos:( Please use Setting app on your device to permit Grisy accessing your library"
            
            switch status {
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({ (newStatus) in
                    if newStatus == .authorized {
                        self.presentImagePicker(sourceType: sourceType)
                    } else {
                        self.troubleAlert(message: noPermissionMessage)
                    }
                })
            case .authorized:
                self.presentImagePicker(sourceType: sourceType)
            case .denied, .restricted:
                self.troubleAlert(message: noPermissionMessage)
            }
        }
        else {
            troubleAlert(message: "Sincere apologies, it looks like we can't access your photo library at this time")
        }
    }
    
    func presentImagePicker(sourceType: UIImagePickerControllerSourceType) {
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //        picker.dismiss(animated: true, completion: nil)
    //        let newImage = info[UIImagePickerControllerOriginalImage] as? UIImage
    //        processPicked(image: newImage)
    //  }
    
    func troubleAlert(message: String?) {
        let alertController = UIAlertController(title: "Oops...", message:message , preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Got it", style: .cancel)
        alertController.addAction(OKAction)
        present(alertController, animated: true)
        
        
    }
    
    func processPicked(image: UIImage?) {
        if let newImage = image {
            creation.image = newImage
            
        }
    }
    
    func goToEditor() {
        
    if  let controller:ImageEditorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageEditorViewController") as? ImageEditorViewController {
        controller.creation = creation
        self.present(controller, animated: true, completion: nil)
        print("finish")
        }
    }
}

extension IntroViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let newImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        processPicked(image: newImage)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel")
    }
    
}





















//        func animateImageChange() {
//           UIView.transition(with: self.creationImageView, duration: 0.4, options: .transitionCrossDissolve, animations: {
//                self.creationImageView.image = self.creation.image
//            }, completion: nil)
//        }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    // any additional setup after loading the view
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // dispose of any resources that can be created
//    }

//@IBOutlet weak var collectionView: UICollectionView!
//
//    var collectionData = ["bird", "butterfly", "horse", "dog"]
//
//   override func viewDidLoad() {
//        super.viewDidLoad()
//        let width = (view.frame.size.width - 20) / 3
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: width, height: width)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose any resource that can be recreated
//    }
//}
//
//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_collectionView: UICollectionView, numberOfInSection section: Int) -> Int {
//        return collectionData.count
//    }
//
//    func collectionView(_collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
//        if let label = cell.viewWidthTag(100) as? UILabel {
//            label.text = collectionData[indexPath.row]
//        }
//    }
//    return cell
//}





















