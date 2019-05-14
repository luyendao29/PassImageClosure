//
//  DetailViewController.swift
//  PassImageClosure
//
//  Created by Boss on 5/12/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var images: UIImageView!
    var data: UIImage?
    var callBack: ((UIImage?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            images.image = data
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func passdata(_ sender: Any) {
        callBack?(images.image)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
    images.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }


}
