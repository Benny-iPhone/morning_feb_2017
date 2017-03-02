//
//  ViewController.swift
//  Homework_2_3_2017
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderAction()
    }
    
    @IBAction func sliderAction() {
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        myView.backgroundColor = color
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}












