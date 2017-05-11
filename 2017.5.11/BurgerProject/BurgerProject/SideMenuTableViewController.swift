//
//  SideMenuTableViewController.swift
//  BurgerProject
//
//  Created by Benny Davidovitz on 11/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController {
    enum Row : Int{
        static let count = 4
        
        case main
        case profile
        case contacts
        case support
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let row = Row(rawValue: indexPath.row)!
        switch row {
        case .contacts:
            cell.textLabel?.text = "contacts"
        case .support:
            cell.textLabel?.text = "support"
        case .main:
            cell.textLabel?.text = "main"
        case .profile:
            cell.textLabel?.text = "profile"

        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let row = Row(rawValue: indexPath.row)!
        UITabBarController.tabBarController()?.selectedIndex = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)

        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
}















