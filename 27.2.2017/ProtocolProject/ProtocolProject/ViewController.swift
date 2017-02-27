//
//  ViewController.swift
//  ProtocolProject
//
//  Created by Benny Davidovitz on 27/02/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    //MARK: - IBOutlets -
    
    @IBOutlet weak var firstnameTextField: UITextField!
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    //MARK: - View Loaded -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        
        firstnameTextField.becomeFirstResponder()
    }

    @IBAction func tapAction(_ sender: Any) {
        if firstnameTextField.isFirstResponder{
            firstnameTextField.resignFirstResponder()
        }
        
        lastnameTextField.resignFirstResponder()
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //super.prepare(for: segue, sender: sender)
        
        if let secondVC = segue.destination as? SecondViewController{
            var str = firstnameTextField.text ?? ""
            if !str.isEmpty{
                str += " "
            }
            
            str += lastnameTextField.text ?? ""
            
            secondVC.str = str
            secondVC.delegate = self
        }
        
    }
    
    
    //MARK: - UITextField Delegate -

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard textField == lastnameTextField else {
            return true
        }
        
        return firstnameTextField.text?.isEmpty == false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstnameTextField:
            textField.backgroundColor = .yellow
        default:
            textField.backgroundColor = .green
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
    
    
}

extension ViewController : SecondViewControllerDelegate{
    func secondViewController(_ controller: SecondViewController, didSelect color: UIColor?) {
        guard let color = color else {
            return
        }
        
        firstnameTextField.textColor = color
        lastnameTextField.textColor = color
    }
}



































