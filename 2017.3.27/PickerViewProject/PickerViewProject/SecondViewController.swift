//
//  SecondViewController.swift
//  PickerViewProject
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    let names : [[String]] = [
        ["Benny","Daniel","Eliran","Maor","Eyal","Menahem Mendel","Mohamad","Aviv"],
        ["Hisin","Pavlozki","Binyamin","Stern","Davidovitz","Ben Moshe","Oscar","Shams","Ozeri"]
    ]
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    //MARK: - UIPickerView Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return names.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names[component].count
    }
    
    //MARK: - UIPickerView Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var arr : [String] = []
        for i in 0..<pickerView.numberOfComponents{
            let row = pickerView.selectedRow(inComponent: i)
            arr.append(names[i][row])
        }
        
        label.text = arr.joined(separator: " ")
    }


}





















