//
//  MyView.swift
//  ViewProject
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

extension UIView{
    @IBInspectable var borderWidth : CGFloat{
        set{
            layer.borderWidth = newValue
        }
        get{
            return layer.borderWidth
        }
    }

    @IBInspectable var borderColor : UIColor?{
        set{
            layer.borderColor = newValue?.cgColor
        }
        get{
            if let color = layer.borderColor{
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat{
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
}

@IBDesignable class MyView: UIView {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup(){
        backgroundColor = .yellow
    }

    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
        
        //layer.borderWidth = 1
//        layer.borderColor = UIColor.black.cgColor
    }
}





















