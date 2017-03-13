//
//  SinXView.swift
//  SinXGraphProject
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class SinXView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code

        let w = bounds.width
        let h = bounds.height
        
        func convertY(_ y : CGFloat) -> CGFloat{
            return h/2 + 0.45*h*y
        }
        
        func convertX(_ x : CGFloat) -> CGFloat{
            return w/CGFloat(4 * M_PI) * (x + CGFloat(2*M_PI))
        }
        
        let context = UIGraphicsGetCurrentContext()
        
        //draw axis
        
        //x
        context?.move(to: CGPoint(x: convertX(CGFloat(-2 * M_PI)), y: convertY(0)))
        context?.addLine(to: CGPoint(x: convertX(CGFloat(2 * M_PI)), y: convertY(0)))
        
        UIColor.blue.setStroke()
        context?.strokePath()
        //y
        context?.move(to: CGPoint(x: convertX(0), y: convertY(1)))
        context?.addLine(to: CGPoint(x: convertX(0), y: convertY(-1)))
        
        context?.strokePath()
        
        //draw func
        UIColor.black.setStroke()
        
        let startP = CGPoint(x: convertX(CGFloat(-2 * M_PI)), y: convertY(0))
        context?.move(to: startP)
        
        for x in stride(from: CGFloat(-2 * M_PI), to: CGFloat(2 * M_PI), by: 0.01){
            let y = sin(x)
            let p = CGPoint(x: convertX(x), y: convertY(y))
            context?.addLine(to: p)
        }
        
        context?.strokePath()
        
        
    }
    

}















