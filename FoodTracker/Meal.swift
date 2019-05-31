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
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    // - `init?`: failabel initializer, return optional value / implicitly unwrapped optional values (a valid value / nil)
    // - The initializer returns an optional `Meal?` object
    init?(name: String, photo: UIImage?, rating: Int) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating is between 0 and 5 exclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
