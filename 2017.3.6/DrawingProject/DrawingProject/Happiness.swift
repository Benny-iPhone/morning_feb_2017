//
//  Happiness.swift
//  DrawingProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class Happiness: UIView {

    var happy : CGFloat = 1{
        didSet{
            //redraw
            setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let width = bounds.width
        let height = bounds.height
        
        //center point
        let c = CGPoint(x: width * 0.5, y: height * 0.5)
        //face
        let faceRadius = min(width, height) * 0.45
        
        let context = UIGraphicsGetCurrentContext()
        context?.addArc(center: c, radius: faceRadius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        context?.strokePath()
        
        //eyes
        let eyeXDelta = width * 0.15
        var eyeCenter = c
        eyeCenter.x += eyeXDelta
        eyeCenter.y -= height * 0.25
        
        //right eye
        context?.addArc(center: eyeCenter, radius: width  * 0.05, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        UIColor.blue.setStroke()
        context?.strokePath()
        
        //left eye
        eyeCenter.x = c.x - eyeXDelta
        context?.addArc(center: eyeCenter, radius: width  * 0.05, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        
        context?.strokePath()
        
        //mouth
        let d = width * 0.25
        let start = CGPoint(x: c.x + d, y: c.y + height * 0.15)
        let end = CGPoint(x: c.x - d, y: start.y)
        
        let factor = height * 0.15  * happy
        let cp1 = CGPoint(x: start.x - d * 2 / 3, y: start.y + factor)
        let cp2 = CGPoint(x: end.x + d * 2 / 3, y: end.y + factor)
        
        context?.move(to: start)
        context?.addCurve(to: end, control1: cp1, control2: cp2)
        
        UIColor.red.setStroke()
        context?.strokePath()
        
    }
    

}






















