//
//  BranchesTableViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class BranchesTableViewController: UITableViewController {

    var tableArray : [Branch] = Branch.sampleArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sortArrayByUserLocation()
        
        NotificationCenter.default.addObserver(forName: .locationUpdated, object: nil, queue: .main) { (_) in
            self.sortArrayByUserLocation()
            self.tableView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func sortArrayByUserLocation(){
        guard let userLocation = AppManager.manager.locationManager.location else {
            return
        }
        
        tableArray.sort { (b1, b2) -> Bool in
            let distance1 = b1.location.distance(from: userLocation)
            let distance2 = b2.location.distance(from: userLocation)
            
            return distance1 < distance2
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let branch = tableArray[indexPath.row]
        cell.textLabel?.text = branch.name
        
        if let distance = AppManager.manager.locationManager.location?.distance(from: branch.location){
            //user's location retrived
            cell.detailTextLabel?.text = String(format: "%.3f km", distance / 1000)
        } else {
            //no location known at the moment
            cell.detailTextLabel?.text = nil
        }
        
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let nextVC = segue.destination as? BranchDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow{
            
            nextVC.branch = tableArray[indexPath.row]
            
        }
        
    }
    

}
