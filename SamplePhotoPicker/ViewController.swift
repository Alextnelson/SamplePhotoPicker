//
//  ViewController.swift
//  SamplePhotoPicker
//
//  Created by Alexander Nelson on 5/9/16.
//  Copyright © 2016 Alexander Nelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let cameraRollPicker = UIImagePickerController()
    let cameraPicker = UIImagePickerController()
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imageFromCamera: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraRollPicker.delegate = self
        cameraPicker.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }


    @IBAction func pickImageFromCameraRoll(sender: AnyObject) {
        self.presentViewController(cameraRollPicker, animated: true, completion: nil)
    }

    @IBAction func takePhoto(sender: AnyObject) {
        cameraPicker.sourceType = .Camera
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageFromCamera.contentMode = .ScaleAspectFit
            imageFromCamera.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

