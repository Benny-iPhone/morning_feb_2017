//
//  RoundedImageView.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

@IBDesignable class RoundedImageView: UIImageView {

    func makeRound(){
        let r = min(bounds.height, bounds.width) / 2
        
        layer.cornerRadius = r
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        makeRound()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeRound()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        makeRound()
    }
    
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
    
    private func setup(){
        makeRound()
    }


}




