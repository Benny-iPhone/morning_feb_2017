//
//  ViewController.swift
//  PhoneValidation
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func phoneChangedAction(_ sender: UITextField) {
        guard let text = sender.text else {
            return
        }
        
        sender.textColor = text.isValidPhone ? .black : .red
        
        label.text = text.formattedPhone()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = ""
    }

   

}

