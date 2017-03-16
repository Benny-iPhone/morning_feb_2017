//
//  EllipseButton.swift
//  EllipseButtonProject
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class EllipseButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        
        context?.addEllipse(in: rect)
        UIColor.lightGray.setFill()
        context?.fillPath()
        
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
        //retrive font size (8 if not exist)
        let inset = self.titleLabel?.font.pointSize ?? 8
        //make padding to "inset"
        contentEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    //based on
    //http://math.stackexchange.com/questions/76457/check-if-a-point-is-within-an-ellipse
    func check(point : CGPoint) -> Bool{
        let h = bounds.midX
        let k = bounds.midY
        let rx = bounds.width / 2
        let ry = bounds.height / 2
        let x = point.x
        let y = point.y
        
        return (pow(x-h, 2) / pow(rx, 2)) +
            (pow(y-k, 2) / pow(ry, 2)) <= 1
    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let p = touch.location(in: self)
        if check(point: p){
            return super.beginTracking(touch, with: event)
        } else {
            return false
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let p = touch.location(in: self)
        if check(point: p){
            return super.continueTracking(touch, with: event)
        } else {
            return false
        }
    }
    
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        <#code#>
//    }
//    
//    override func cancelTracking(with event: UIEvent?) {
//        <#code#>
//    }

}














