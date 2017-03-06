//
//  ViewController.swift
//  ViewPropertiesProject
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let subView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        subView.backgroundColor = .purple
        
        myView.addSubview(subView)
        
        subView.removeFromSuperview()

        myView.insertSubview(subView, at: 0)

        myView.sendSubview(toBack: subView)
        myView.bringSubview(toFront: subView)
        
        
    }
    
    @IBAction func alphaSliderAction(_ sender: UISlider) {
        myView.alpha = CGFloat(sender.value)
    }
    
    @IBAction func hiddenAction(_ sender: UISwitch) {
        myView.isHidden = !sender.isOn
    }
    
    @IBAction func userInteractionAction(_ sender: UISwitch) {
        myView.isUserInteractionEnabled = sender.isOn
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        for item in view.subviews{
            item.backgroundColor = index == 0 ? .black : .white
        }
        
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        print(#function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

