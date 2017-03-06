//
//  RotationViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        
        sender.view?.transform = CGAffineTransform(rotationAngle: sender.rotation)
        
        if sender.state == .ended{
            UIView.animate(withDuration: 0.3, animations: { 
                sender.view?.transform = .identity
            })
        }
        
    }
    

}
