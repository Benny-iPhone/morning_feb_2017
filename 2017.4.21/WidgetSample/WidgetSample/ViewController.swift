//
//  ViewController.swift
//  WidgetSample
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBAction func saveAction(_ sender: AnyObject) {
        //let defaults = UserDefaults.standard
        let defaults = UserDefaults(suiteName: "group.gr1")
        defaults?.set(textField.text, forKey: "text")
        
        defaults?.synchronize()
    }
    
    @IBAction func readAction(_ sender: Any) {
        let defaults = UserDefaults(suiteName: "group.gr1")
        
        textField.text = defaults?.value(forKey: "text") as? String
        
    }


}

