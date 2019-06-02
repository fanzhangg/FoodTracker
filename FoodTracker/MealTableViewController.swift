//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/31/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    //MARK: Properties
    // a mutable empty array of `Meal` object
    var meals = [Meal]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data
        loadSampleMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Make the table view show 1 section
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows == number of meals
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused & should be dequeued using a cell identifier
        let cellIdentifier = "MealTableViewCell"
        
        // Request a cell from the table view
        // Reuse a cell if its possible, else instantiate a new one
        // - `as? MealTableViewCell` tries to downcast the returned object from the `UITableViewCell` class to `MealTableViewCell` class, return an optional
        // - `guard let`: safely unwrap the optional
        // - Downcast succeeds if the storyboard is set up correctly, and the `cellIdentifier` matches the identifier from the storyboard
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell")
        }
        // Fetch the appropriate meal for the data source layout
        let meal = meals[indexPath.row]
        
        // Configure the cell
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        // - `as?`: optional type cast operator, downcast the segue's source view controller to a `MealViewController` instance
        // If downcast succeeds, assigne the `MealViewController` instance to the local constant `sourceViewController`, & check to see if the meal property on `sourceViewController` is `nil`
        // If the `meal` property is not `nil`, assign the value of the property to the local constant `meal` & execute the `if` statement
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            // Add a new meal.
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            // Animate the addition of a new row to the table view
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: Private Methods
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal3")
        }
        
        // Add meal objectrs to the `meals` array
        meals += [meal1, meal2, meal3]
    }

}
