//
//  AppControl.swift
//  CustomControlProject
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

@IBDesignable class AppControl: UIControl {

    @IBInspectable var borderColor : UIColor? = nil{
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 1{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
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
        layer.masksToBounds = true
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
    }
    
    private func makeHighlight(_ h : Bool){
        for sub in self.subviews{
            sub.alpha = h ? 0.6 : 1
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        self.makeHighlight(true)
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        self.makeHighlight(false)
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        self.makeHighlight(false)
        super.cancelTracking(with: event)
    }

}


















