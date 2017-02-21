//
//  ViewController.swift
//  HelloWorld
//
//  Created by Benny Davidovitz on 20/02/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBAction func textAction(_ sender: AnyObject) {

        guard let text = textField.text else {
            return
        }
        
        label2.text = "hello " + text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textAction(textField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

