//
//  DateTextField.swift
//  Change
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DateTextField: BaseTextField {

    override func setup() {
        super.setup()
        
        let datePicker = UIDatePicker()
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        
        datePicker.addTarget(self, action: #selector(datePickerAction), for: .valueChanged)
        
        inputView = datePicker
    }
    
    func datePickerAction(){
        guard let datePicker = inputView as? UIDatePicker else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.text = formatter.string(from: datePicker.date)
    }
    
    override func becomeFirstResponder() -> Bool {
        let didOpenKeyboard = super.becomeFirstResponder()
        if didOpenKeyboard && (text == nil || text!.isEmpty){
            datePickerAction()
        }
        
        return didOpenKeyboard
    }

}










