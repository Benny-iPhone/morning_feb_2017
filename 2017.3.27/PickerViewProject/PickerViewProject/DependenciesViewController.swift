//
//  DependenciesViewController.swift
//  PickerViewProject
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DependenciesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    enum Comp : Int{
        case states
        case zipcodes
        
        static let count = 2
    }
    
    let bigData : [String:[String]]
    let states : [String]
    var zipcodes : [String]
    
    required init?(coder aDecoder: NSCoder) {
        //1. check that file exist
        //2. make sure that its a dictionary
        //3. make sure that dictioanry is in the correct format
        //4. initiate everything
        
        guard
            let path = Bundle.main.path(forResource: "statedictionary", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path),
            let dict = dictionary as? [String:[String]]
            else{
                bigData = [:]
                states = []
                zipcodes = []
                super.init(coder: aDecoder)
                return
        }
        
        bigData = dict
        states = Array(dict.keys).sorted()
        if let s = states.first, let arr = bigData[s]{
            zipcodes = arr
        } else {
            zipcodes = []
        }
        
        super.init(coder: aDecoder)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - UIPickerView Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Comp.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let comp = Comp(rawValue: component) else {
            return 0
        }
        
        switch comp {
        case .states:
            return states.count
        case .zipcodes:
            return zipcodes.count
        }
    }
    
    //MARK: - UIPickerView Delegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let comp = Comp(rawValue: component) else {
            return nil
        }
        
        switch comp {
        case .states:
            return states[row]
        case .zipcodes:
            return zipcodes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let comp = Comp(rawValue: component) else {
            return
        }

        if comp == .states{
            //update data
            let s = states[row]
            zipcodes = bigData[s] ?? []
            
            //update ui
            pickerView.reloadComponent(Comp.zipcodes.rawValue)
            
            pickerView.selectRow(0, inComponent: Comp.zipcodes.rawValue, animated: true)
        }
        
    }
    
}















