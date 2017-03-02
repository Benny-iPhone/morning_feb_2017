//
//  SecondViewController.swift
//  ProtocolProject
//
//  Created by Benny Davidovitz on 27/02/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func secondViewController(_ controller : SecondViewController, didSelect color : UIColor?)
}

class SecondViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    enum Colors : Int{
        case black, orange, blue, magenta
        
        static let count = 4
        
        func toString() -> String{
            switch self {
            case .black: return "שחור"
            case .orange: return "כתום"
            case .blue: return "כחול"
            case .magenta: return "ורוד של בנות"
            }
        }
        
        func toColor() -> UIColor{
            switch self {
            case .black: return .black
            case .orange: return .orange
            case .blue: return .blue
            case .magenta: return .magenta
            }
        }
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    var str : String?
    var delegate : SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = str
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.backgroundColor = .white
        
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - UIPickerView protocols
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Colors(rawValue: row)?.toString()
        //return "Row \(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c = Colors(rawValue: row)?.toColor()
        delegate?.secondViewController(self, didSelect: c)
    }

}



















