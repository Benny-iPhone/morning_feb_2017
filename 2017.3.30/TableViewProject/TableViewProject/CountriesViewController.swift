//
//  CountriesViewController.swift
//  TableViewProject
//
//  Created by Benny Davidovitz on 30/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableArray : [String]
    
    required init?(coder aDecoder: NSCoder) {
        
        let locale = NSLocale.current
        let arr = NSLocale.isoCountryCodes.map { (code) -> String in
            return locale.localizedString(forRegionCode: code)!
        }
        
        tableArray = arr.sorted(by: <)
        
        super.init(coder: aDecoder)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row]
        cell.textLabel?.textAlignment = .right
        
        return cell
    }
}








