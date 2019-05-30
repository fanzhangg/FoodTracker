//
//  Meal.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/30/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

import UIKit

class Meal {
    // MAKR: properties
    var name: String
    var photo: UIImage
    var rating: Int
    
    // MARK: Initialization
    // - `init?`: failabel initializer, return optional value / implicitly unwrapped optional values (a valid value / nil)
    // - The initializer returns an optional `Meal?` object
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialization fails if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo!
        self.rating = rating
    }
}
