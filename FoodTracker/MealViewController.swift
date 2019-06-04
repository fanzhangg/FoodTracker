//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/19/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // `UITextFieldDelegate` protocal allows the `ViewController` class to act as a valid text field delegate
    
    //MARK: Properties
    //Outlets" refer to your interface elements in code
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), the view controller needs to be dismissed in 2 ways
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            // Dismiss the meal detail scene
            dismiss(animated: true, completion: nil)
            }
        // If the user is editing an existing meal
        // - `if let`: safely unwrap the view controller's `navigationController` property
        else if let owningNavigationController = navigationController {
            // Pop the current controller off the navigation stack & animate the transition
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    
    /*
    This value is either passed by `MealTableViewController` in `prepare(for:sender:)` or constructed as part of adding a new meal
    */
    var meal: Meal?
    
    // `IBOutlet` attribute: connect to the `nameTextField` property from Interface Builder
    // `weak` keyword: the reference does not prevent the system from deallocating the referenced object; prevent reference cycles
    // * Some parts have strong references to the object (i.e. superview)
    // Implicitly unwrapped optional variable of type `UITextField`
    // `!`: indicate the type is an implicitly unwrapped optional (an optional type having a value after its first set)
    
    override func viewDidLoad() {
        // Assigend valid values to all controller's outlets, & safely access the contents after it is called
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Handle the text field's user input through delegate callbacks
        // - `self` refers to the `ViewController` class
        nameTextField.delegate = self
        
        // Set up views if editing an existing Meal
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text   = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Enable the Save button only if the text field has a valid Meal name
        updateSaveButtonState()
    }
    
    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        // Resign the text field's first-responder status
        textField.resignFirstResponder()
        // Indicate the system should process the press of the `Return` key
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Read the information entered into the text field & do sth
        // Check if the text field has text in it
        updateSaveButtonState()
        // Set the title of the scene to the text
        navigationItem.title = textField.text
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
    
    //MARK: Navigation
    // This method lets you configure a view controller before it is presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        // Create constnats from the current text field text, selected image, & rating in the scene
        // - `??`: nil coalescing operator, return the value of an optional if has a value, or return a default value otherwise
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        // Set the meal to be passed to MealTableViewController after the unwind segue
        meal = Meal(name: name, photo: photo, rating: rating)
    }
    
    //MARK: Actions
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        // `sender`: the objects that is responsible to trigger the action
//        // `IBAction`: an action that you can connect to from your storyboard in Interface Builder
//        // `func setDefaultLabelText`: decalre a method
//
//        // Set the label's `text` property to Default Text
//        // ! swift can infer the type
//        mealNameLabel.text = "Default Text"
//    }

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
    
    // Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

