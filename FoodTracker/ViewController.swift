//
//  ViewController.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/19/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

import UIKit

// Define a subclass of UIViewController
class ViewController: UIViewController {
    
    //MARK: Properties
    //Outlets" refer to your interface elements in code
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    // `IBOutlet` attribute: connect to the `nameTextField` property from Interface Builder
    // `weak` keyword: the reference does not prevent the system from deallocating the referenced object; prevent reference cycles
    // *Some parts have strong references to the object (i.e. superview)
    // Implicitly unwrapped optional variable of type `UITextField`
    // `!`: indicate the type is an implicitly unwrapped optional (an optional type having a value after its first set)
    
    override func viewDidLoad() {
        // Assigend valid values to all controller's outlets, & safely access the contents after it is called
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    


}

