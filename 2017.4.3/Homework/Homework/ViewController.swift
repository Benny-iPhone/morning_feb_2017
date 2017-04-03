//
//  ViewController.swift
//  Homework
//
//  Created by hackeru on 03/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension String {
    
    subscript (i: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: i)])
    }
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableDictionary : [String:[String]]
    let allChars : [String]
    
    required init?(coder aDecoder: NSCoder) {
        
        let locale = NSLocale.current
        let arr = NSLocale.isoCountryCodes.map { (code) -> String in
            return locale.localizedString(forRegionCode: code)!
        }
        
        var dict : [String:[String]] = [:]
        for str in arr{
            let char = str[0]
            if var subArr = dict[char]{
                subArr.append(str)
                dict[char] = subArr
            } else {
                dict[char] = [str]
            }
        }
        
        
        tableDictionary = dict
        allChars = Array(dict.keys).sorted()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return allChars.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let subArr = tableDictionary[allChars[section]] ?? []
        return subArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let subArr = tableDictionary[allChars[indexPath.section]] ?? []
        cell.textLabel?.text = subArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allChars[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return allChars
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

}



















