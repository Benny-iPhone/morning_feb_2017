//
//  ViewController.swift
//  DrawingProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var happiness: Happiness!

    @IBAction func sliderAction(_ sender: UISlider) {
        
        happiness.happy = CGFloat(sender.value)
        
    }

}

