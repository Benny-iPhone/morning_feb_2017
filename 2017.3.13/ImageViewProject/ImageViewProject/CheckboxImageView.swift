//
//  CheckboxImageView.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class CheckboxImageView: UIImageView {

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
        image = #imageLiteral(resourceName: "unchecked_checkbox")
        highlightedImage = #imageLiteral(resourceName: "checked_2")
        
        //setup tap
        isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }

    func handleTap(){
        self.isHighlighted = !isHighlighted
    }

}



















