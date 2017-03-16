//
//  SpriteSheetImageView.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class SpriteSheetImageView: UIImageView {

    @IBInspectable var bigImage : UIImage? = nil
    @IBInspectable var bigImageRows : UInt = 1
    @IBInspectable var bigImageColumns : UInt = 1
    
    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //like viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup(){
        guard let bigImage = bigImage else {
            return
        }
        
        let arr = bigImage.spriteSheet(cols: bigImageColumns, rows: bigImageRows)
        animationImages = arr
        image = arr.first
        
        animationRepeatCount = 0
        animationDuration = TimeInterval(arr.count) * 1.0/20.0
        
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func handleTap(){
        if isAnimating { stopAnimating() } else  { startAnimating() }
    }


}








