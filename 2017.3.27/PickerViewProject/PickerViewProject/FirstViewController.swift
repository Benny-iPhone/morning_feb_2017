//
//  FirstViewController.swift
//  PickerViewProject
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    let pickerArray : [String] = ["Sierra",
                                  "El Capitan",
                                  "Yosemite",
                                  "Mavericks",
                                  "Mountain Lion",
                                  "Lion",
                                  "Snow Leopard",
                                  "Leopard",
                                  "Tiger"]
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = pickerArray[0]
    }
    
    //MARK: - UIPickerView Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    //MARK: - UIPickerView Delegate
/*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
 */
    /*
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let color = row % 2 == 0 ? UIColor.purple : UIColor.cyan
        
        let atts : [String:Any] = [
            NSForegroundColorAttributeName:color
        ]
        
        return NSAttributedString(string: pickerArray[row], attributes: atts)
        
    }*/
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel()
        label.text = pickerArray[row]
        label.textAlignment = .center
        label.textColor = row % 2 == 0 ? .blue : .red
        label.font = row % 2 == 0 ? UIFont.boldSystemFont(ofSize: 16) : UIFont.italicSystemFont(ofSize: 18)
        
        return label
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = pickerArray[row]
    }

}











