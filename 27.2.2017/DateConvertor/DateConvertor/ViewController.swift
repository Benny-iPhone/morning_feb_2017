//
//  ViewController.swift
//  DateConvertor
//
//  Created by Benny Davidovitz on 27/02/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!

    var type : ConvertType = .gregToHeb{
        didSet{
            datePicker.calendar = type.sourceCalendar()
            refreshAction()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshAction()
    }
    
    @IBAction func refreshAction() {
        let date = datePicker.date
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.calendar = type.destinationCalendar()
        //formatter.locale = Locale(identifier: "he")
        
        label.text = formatter.string(from: date)
        
    }
    
    @IBAction func segmentAction() {
        guard let t = ConvertType(rawValue: segmentControl.selectedSegmentIndex) else{
            print("warning! unsupported index")
            return
        }
        
        type = t
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
















