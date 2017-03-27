//
//  ViewController.swift
//  Change
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    var pickerArray : [Currency] = []
    
    @IBOutlet weak var currencyTextField: CurrencyTextField!
    @IBOutlet weak var dateTextField: DateTextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    func fetchData(){
        
        AppManager.manager.getRates(with: dateTextField.text, source: currencyTextField.text) {
            self.pickerArray = $0
            self.pickerView.reloadAllComponents()
        }
        
        print("request sent")
        
    }

    @IBAction func didEndOnExitAction(_ sender: UITextField) {
        sender.resignFirstResponder()
        
        fetchData()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let c : Currency = pickerArray[row]
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = c.code
        let rateString = formatter.string(from: c.rate as NSNumber)
        
        return c.code + " : " + rateString!
    }

}




















