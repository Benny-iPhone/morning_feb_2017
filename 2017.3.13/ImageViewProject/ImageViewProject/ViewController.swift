//
//  ViewController.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        guard let imageView = sender.view as? UIImageView else {
            return
        }
        
        imageView.isHighlighted = !imageView.isHighlighted
        
        
    }


}

