//
//  Meal.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/30/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    // MAKR: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    var descript: String
    // Look up URL for your app's documents directory (save data for the user)
    // - OK to unwrap the optional since the returned array should only cantain one match
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey {
        // `static`: the property belong to the structure itself, not the instance of structure
        // Access by `PropertyKey.name`
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        static let descript = "descript"
    }
    
    // MARK: Initialization
    // - `init?`: failabel initializer, return optional value / implicitly unwrapped optional values (a valid value / nil)
    // - The initializer returns an optional `Meal?` object
    init?(name: String, photo: UIImage?, rating: Int, descript: String) {
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
        self.descript = descript
    }
    
    //MARK: NSCoding
    // Prepare the class's information to be archived
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(descript, forKey: PropertyKey.descript)
    }
    
    // `convenience`: a secondary initializer
    // `?`: failable initialzer that might return `nil`
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
            else {
                os_log("Unable to decode the name for a Meal object", log: OSLog.default, type: .debug)
                return nil
        }
        
        // Since photo is an optional property of Meal, use conditional cast to unarchive `photo`
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        // Unarchive `rating`
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        // Unarchive `descript``
        guard let descript = aDecoder.decodeObject(forKey: PropertyKey.descript) as? String else {
            os_log("Unable to decode the descript for a Meal object", log: OSLog.default, type: .debug)
            return nil
        }
        // Must call designated initializer
        self.init(name: name, photo: photo, rating: rating, descript: descript)
    }
}
