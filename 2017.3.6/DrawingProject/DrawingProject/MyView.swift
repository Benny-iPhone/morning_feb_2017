//
//  MyView.swift
//  DrawingProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

@IBDesignable class MyView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let width = bounds.width
        let height = bounds.height
        
        let context : CGContext? = UIGraphicsGetCurrentContext()
        //put context at certain point
        context?.move(to: CGPoint(x: width * 0.5, y: height * 0.1))
        //draw line to other point
        context?.addLine(to: CGPoint(x: width * 0.9, y: height * 0.9))
        context?.addLine(to: CGPoint(x: width * 0.1, y: height * 0.9))
        //close shape
        context?.closePath()
        
        //border size
        context?.setLineWidth(3)
        
        //stoke color
        //context?.setStrokeColor(UIColor.red.cgColor)
        UIColor.red.setStroke()
        
        UIColor.cyan.setFill()
        
        //paint shape's border
        //context?.strokePath()
        
        //paint border & fill
        
        context?.drawPath(using: .fillStroke)
        
    }
 

}





























