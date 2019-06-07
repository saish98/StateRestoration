//
//  ViewControllerTwo.swift
//  StateRestoration
//
//  Created by saish chachad on 07/06/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    // These functions are important, others are "SAB MOHA-MAYA"
    override func encodeRestorableState(with coder: NSCoder) {
        if let str = textfieldCardNumber.text{
            coder.encode(str, forKey: "TextData")
        }
        
        if let img = myImageView.image {
            coder.encode(img, forKey:"ImgData")
        }
        
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        textfieldCardNumber.text = coder.decodeObject(forKey: "TextData") as? String
        myImageView.image = coder.decodeObject(forKey: "ImgData") as? UIImage
        
        super.decodeRestorableState(with: coder)
    }
    
    override func applicationFinishedRestoringState() {
        guard let str = textfieldCardNumber.text else {
            return
        }
        print("Restored value textFieldData.text: \(str)")
    }
    
    
    //--------------- Not really important ---------------
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var textfieldCardNumber: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func openPhotosApp(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openCameraApp(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            
            present(imagePicker,animated: true,completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "State Restoration"
        imagePicker.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// Image picker delegate
extension ViewControllerTwo: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        myImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
}


