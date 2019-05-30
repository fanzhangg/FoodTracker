//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/29/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

import UIKit

// `@IBDesignable`: let Interface Builder instantiate & draw a copy of the control directly in canvas; let layout engine properly position & size the control
@IBDesignable class RatingControl: UIStackView {
    // MARK: Properties
    // List of buttons
    private var ratingButtons = [UIButton]()
    
    // Define size of the buttons
    // `{ ...}` property observer, observe & respond to changes in a property's value
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    // Define number of the buttons
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    // Internal access
    var rating = 0
    
    // MARK: Initialization
    override init(frame: CGRect) {
        // Call the superclass's initializer
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed!")
    }
    
    
    // MARK: Private Methods
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        // - `UIImage(named:)`: use since images is in the app's main bundle
        // - `in: bundle`: since the setup code needs to run in Interfacce Builder, must explicitly specify the catalog's bundle
        let filledStar = UIImage(named:"filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // - `<`: half-open range operator, doesn't include the upper number
        // - `_`: wildcard, use when no need to know which iteration of the loop is currently executing
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            // - disable the auto generated contraints
            button.translatesAutoresizingMaskIntoConstraints = false
            // - define the button's height & width
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Set up the button action
            // - `self`: Target is the `Ratingcontrol` object
            // - `#selector`: return the `Selector` value, an opaque value that identifies the method
            // - `for:`: `UIControlEvents` option set defines a number of events that controls can respond to
            // - `.touchUpInside`: an event that  occurs when the user touches the button, and then lifts their finger while the finger is still within the button’s bounds
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
    
}
