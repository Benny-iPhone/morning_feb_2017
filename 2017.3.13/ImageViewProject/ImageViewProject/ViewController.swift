//
//  ViewController.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var spriteSheetImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spriteSheetImageView.isUserInteractionEnabled = true
        
        let bigImage = #imageLiteral(resourceName: "spritesheet")
        let arr = bigImage.spriteSheet(cols: 7, rows: 3)
        
        spriteSheetImageView.image = arr[0]
        spriteSheetImageView.animationImages = arr
        
        spriteSheetImageView.animationDuration = 1.5
        spriteSheetImageView.animationRepeatCount = 0
        
    }
    
    @IBAction func spriteSheetTapAction(_ sender: UITapGestureRecognizer) {
        
        if spriteSheetImageView.isAnimating{
            spriteSheetImageView.stopAnimating()
        } else {
            spriteSheetImageView.startAnimating()
        }
        
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        guard let imageView = sender.view as? UIImageView else {
            return
        }
        
        imageView.isHighlighted = !imageView.isHighlighted
        
        
    }


}

