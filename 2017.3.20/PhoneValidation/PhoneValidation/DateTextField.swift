//
//  DateTextField.swift
//  PhoneValidation
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class DateTextField: MMTextField {

    var date : Date?{
        get{
            return (inputView as? UIDatePicker)?.date
        }
    }
    
    override func setup() {
        super.setup()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        
        inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(update), for: .valueChanged)
    }
    
    func update(){
        guard let datePicker = inputView as? UIDatePicker else {
            return
        }
        
        let date = datePicker.date
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        self.text = formatter.string(from: date)
    }
    
    //keyboard open
    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        if result {
            update()
        }
        
        return result
    }
}















