//
//  MealsTableViewController.swift
//  Menu
//
//  Created by Benny Davidovitz on 30/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {

    let tableArray : [Meal] = Meal.readFile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Resturant Menu"

        self.clearsSelectionOnViewWillAppear = true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MealCell

        // Configure the cell...
        cell.configure(with: tableArray[indexPath.row])

        return cell
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "deatilsSegue"{
            guard let indexPath = tableView.indexPathForSelectedRow else{
                return
            }
            
            let nextVC = segue.destination as? MealDetailsViewController
            nextVC?.meal = tableArray[indexPath.row]
        }
        
    }
    

}
















