//
//  ViewController.swift
//  ControlsProject
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var killSwitch: UISwitch!
    @IBOutlet weak var verticalSlider: UISlider!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.1f", sender.value)
    }
    
    
    @IBAction func killAppSwitchAction(_ sender: UISwitch) {
        if sender.isOn{
            return
        }
    
        
    UIApplication.shared.perform(#selector(URLSessionTask.suspend))
        Thread.sleep(forTimeInterval: 2)
        exit(0)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        verticalSlider.isHidden = !sender.isOn
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        //label.text = "\(sender.value)"
        label.text = String(format: "%.2f", sender.value)
        
        killSwitch.transform = CGAffineTransform(scaleX: CGFloat(sender.value), y: CGFloat(sender.value))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.sendActions(for: .valueChanged)
        
        let value : Float = 1
        label.text = String(format: "%.2f", value)
        
        //slider.setThumbImage(#imageLiteral(resourceName: "trump_on"), for: .highlighted)
        slider.setThumbImage(#imageLiteral(resourceName: "trump_off"), for: .normal)
        
        verticalSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-0.5 * M_PI))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

