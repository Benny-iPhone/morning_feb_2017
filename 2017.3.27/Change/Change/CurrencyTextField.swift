//
//  CurrencyTextField.swift
//  Change
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class CurrencyTextField: BaseTextField , UIPickerViewDataSource, UIPickerViewDelegate{

    let array = ["EUR","ILS","USD","GBP"]
    
    override func setup() {
        super.setup()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.backgroundColor = .white
        inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = array[row]
        
        sendActions(for: .editingChanged)
    }
    
    override func becomeFirstResponder() -> Bool {
        let didOpenKeyboard = super.becomeFirstResponder()
        if didOpenKeyboard && (text == nil || text!.isEmpty){
            text = array.first
        }
        
        return didOpenKeyboard
    }
    
    

}













