//
//  ViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        let point : CGPoint = sender.location(in: self.view)
        let v : Double = 100
        let s = Double(sqrt(pow(point.x - targetView.center.x, 2) + pow(point.y - targetView.center.y, 2)))
        let t = s/v
        /*
        UIView.animate(withDuration: t) {
            self.targetView.center = point
        }*/
        
        //linear
        UIView.animate(withDuration: t, delay: 0, options: .curveLinear, animations: { 
            self.targetView.center = point
        }, completion: nil)
        
        ///targetView.center = point
        
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
        let point : CGPoint = sender.location(in: self.view)
        targetView.center = point

    }


}

