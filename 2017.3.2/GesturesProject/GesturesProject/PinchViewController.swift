//
//  PinchViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    @IBOutlet weak var widthLayout: NSLayoutConstraint!
    @IBOutlet weak var heightLayout: NSLayoutConstraint!
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
                
        if sender.state == .ended{
            widthLayout.constant = 200
            heightLayout.constant = 200
            
            //update constraints in animation
            UIView.animate(withDuration: 0.3, animations: { 
                self.view.layoutIfNeeded()
            })
            
        } else {
        
            let constant = 200 * sender.scale
            widthLayout.constant = constant
            heightLayout.constant = constant
        }
        
        /*
        sender.view?.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
        if sender.state == .ended{
            UIView.animate(withDuration: 1 /* seconds */, animations: {
                sender.view?.transform = CGAffineTransform.identity
            })
        }*/
        
    }


}
