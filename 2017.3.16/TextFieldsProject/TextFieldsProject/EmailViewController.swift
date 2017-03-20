//
//  EmailViewController.swift
//  TextFieldsProject
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

extension String {
    var isEmail : Bool {
        get{
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
        }
    }
}

class EmailViewController: UIViewController {

    @IBAction func emailDidChange(_ sender: ValidationTextField) {
        
        guard let text = sender.text, !text.isEmpty else {
            sender.valid = .nothing
            return
        }
        
        sender.valid = text.isEmail ? .okay : .wrong
        
    }
    
    @IBAction func tapAction(_ sender: Any) {
        
        self.view.endEditing(true)
    }
}














