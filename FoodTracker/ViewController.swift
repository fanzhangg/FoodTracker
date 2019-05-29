//
//  ViewController.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/19/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // `UITextFieldDelegate` protocal allows the `ViewController` class to act as a valid text field delegate
    
    //MARK: Properties
    //Outlets" refer to your interface elements in code
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // `IBOutlet` attribute: connect to the `nameTextField` property from Interface Builder
    // `weak` keyword: the reference does not prevent the system from deallocating the referenced object; prevent reference cycles
    // *Some parts have strong references to the object (i.e. superview)
    // Implicitly unwrapped optional variable of type `UITextField`
    // `!`: indicate the type is an implicitly unwrapped optional (an optional type having a value after its first set)
    
    override func viewDidLoad() {
        // Assigend valid values to all controller's outlets, & safely access the contents after it is called
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Handle the text field's user input through delegate callbacks
        // - `self` refers to the `ViewController` class
        nameTextField.delegate = self

    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        // Resign the text field's first-responder status
        textField.resignFirstResponder()
        // Indicate the system should process the press of the `Return` key
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Read the information entered into the text field & do sth.
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. Use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        // Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        // `sender`: the objects that is responsible to trigger the action
        // `IBAction`: an action that you can connect to from your storyboard in Interface Builder
        // `func setDefaultLabelText`: decalre a method
        
        // Set the label's `text` property to Default Text
        // ! swift can infer the type
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard
        // If the user taps the image view while typing in the text field, the keyboard is dismissed properly
        nameTextField.resignFirstResponder()
        
        // Create a image picker controller
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // **enumeration:** `.photoLibrary` is the abbrevation of `UIImagePickerControllerSourceType.photoLibrary`
        
        // Make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        // Ask `ViewController` to present the view controller defined by `imagePickerController`
        // `completion: nil`: don't need to excute a completion handler
        present(imagePickerController, animated: true, completion: nil)
    }
    

}

