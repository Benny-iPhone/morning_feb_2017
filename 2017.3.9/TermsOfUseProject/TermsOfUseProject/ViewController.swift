//
//  ViewController.swift
//  TermsOfUseProject
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FRHyperLabel

class ViewController: UIViewController {

    @IBOutlet weak var label: FRHyperLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = label.text ?? ""
        
        let atts = [
            NSFontAttributeName:UIFont.preferredFont(forTextStyle: .headline)]
        
        let attString = NSAttributedString(string: text, attributes: atts)
        
        label.attributedText = attString
    }
    
    
    //finished building constraints
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.clearActionDictionary()
        
        label.setLinkForSubstring("terms of use") { (_, str) in
            print(str ?? "")
            self.performSegue(withIdentifier: "showTerms", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}









