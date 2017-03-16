//
//  AppButton.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

@IBDesignable class AppButton: UIButton {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
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
        backgroundColor = .lightGray
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        layer.cornerRadius = 8
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        
        self.setTitleColor(.black, for: .normal)
        setTitleColor(.red, for: .disabled)
        setTitleColor(.blue, for: .highlighted)
        
        //padding
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        sizeToFit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        sizeToFit()
    }

}






















