//
//  CircleView.swift
//  ViewProject
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

@IBDesignable class CircleView: UIView {

    @IBInspectable var circleWidth : CGFloat = 1{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var circleColor : UIColor?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        var circleRect = bounds
        circleRect.origin.x += circleWidth / 2
        circleRect.origin.y += circleWidth / 2
        circleRect.size.width -= circleWidth
        circleRect.size.height -= circleWidth
        
        context?.addEllipse(in: circleRect)
        
        //UIColor.red.setStroke()
        circleColor?.setStroke()
        context?.setLineWidth(circleWidth)
        
        context?.strokePath()
        
    }
    

}















