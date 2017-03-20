//
//  DateTextField.swift
//  TextFieldsProject
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class DateTextField: AppTextField {

    var date : Date{
        get{
            return (inputView as! UIDatePicker).date
        }
    }
    
    override func setup() {
        super.setup()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        datePicker.date = Date()
        
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
        
        inputView = datePicker
        
        let width = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [spaceButton,donebutton]
        
        inputAccessoryView = toolBar
        
    }
    
    func doneAction(){
        sendActions(for: .editingDidEndOnExit)
    }
    
    func datePickerAction(_ sender : UIDatePicker){
        
        self.sendActions(for: .editingChanged)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        text = formatter.string(from: sender.date)
        
    }

}
