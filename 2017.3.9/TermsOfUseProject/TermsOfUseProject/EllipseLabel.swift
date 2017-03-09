//
//  EllipseLabel.swift
//  TermsOfUseProject
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class EllipseLabel: UILabel {

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
        textColor = .white
        textAlignment = .center
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        context?.addEllipse(in: bounds)
        
        UIColor.black.setStroke()
        UIColor.gray.setFill()
        
        context?.drawPath(using: .fillStroke)
        
        super.draw(rect)
    }
 

}








