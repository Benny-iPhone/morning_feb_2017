//
//  ViewController.swift
//  Homework
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum Color : Int{
        case Black, Red, Green, Blue
        
        func color() -> UIColor{
            switch self {
            case .Black: return .black
            case .Red: return .red
            case .Green: return .green
            case .Blue: return .blue
            }
        }
    }

    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorView.backgroundColor = Color.Black.color()
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        guard let c = Color(rawValue: index) else {
            debugPrint("unsupported index \(index)")
            return
        }
        
        UIView.animate(withDuration: 1) { 
            self.colorView.backgroundColor = c.color()
        }
        
        //colorView.backgroundColor = c.color()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}










