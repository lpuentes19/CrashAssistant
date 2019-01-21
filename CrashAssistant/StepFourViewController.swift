//
//  StepFourViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepFourViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        sharePhotosButton.layer.borderWidth = 1
        sharePhotosButton.layer.borderColor = UIColor.lightGray.cgColor
        sharePhotosButton.layer.masksToBounds = true
        sharePhotosButton.layer.cornerRadius = 5
        
        instructionsTextView.layer.borderWidth = 1
        instructionsTextView.layer.borderColor = UIColor.lightGray.cgColor
        instructionsTextView.layer.cornerRadius = 10
        instructionsTextView.layer.masksToBounds = true
    }
    
    // Gaining access to the camera and photo library
    func getImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo", message: "Choose Source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                print("Camera not available")
                let alertController = UIAlertController(title: "Camera is not available", message: "You have not given permission to use the camera or there is no camera available", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                print("Photo Library not available")
                let alertController = UIAlertController(title: "Photo Library is not available", message: "You have not given permission to use the Photo Library or there is no Photo Library available", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    // Saving image to photo library and also setting the picture as the image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let originalImage = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        
        UIImageWriteToSavedPhotosAlbum(originalImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
        accidentImageView.image = originalImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Saving Image to Photo Library
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var accidentImageView: UIImageView!
    @IBOutlet weak var sharePhotosButton: UIButton!
    // Implementing the sharing feature
    @IBAction func sharePhotosButtonTapped(_ sender: Any) {
        
        guard let image: UIImage = accidentImageView.image else { return }
        
        let imageToShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        activityViewController.excludedActivityTypes = [.airDrop, .postToFacebook]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    @IBAction func imageViewTapped(_ sender: Any) {
        getImage()
    }
}
