//
//  ViewController.swift
//  TextFieldsProject
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make it behave like user typed something
        firstnameTextField.sendActions(for: .editingChanged)
        //open keyboard
        firstnameTextField.becomeFirstResponder()
        
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
    }

    
    @IBAction func editingChangedAction(_ sender: AnyObject) {
        
        let firstname = firstnameTextField.text ?? ""
        let lastname = lastnameTextField.text ?? ""
        
        label.text = firstname + " " + lastname
    }
    
    @IBAction func didEndOnExitAction(_ sender: UITextField) {
        if let nextField = view.viewWithTag(sender.tag + 1){
            nextField.becomeFirstResponder()
        } else {
            sender.resignFirstResponder()
        }
    }
    
    @IBAction func tapAction(_ sender: AnyObject) {
        if firstnameTextField.isFirstResponder{
            firstnameTextField.resignFirstResponder()
        } else if lastnameTextField.isFirstResponder{
            lastnameTextField.resignFirstResponder()
        }
    }
   
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        switch textField {
        case lastnameTextField:
            return firstnameTextField.text != nil && firstnameTextField.text!.isEmpty == false
        default:
            return true
        }
        
    }
}




























