//
//  CustomLabel.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

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
        backgroundColor = .black
        textColor = .white
        textAlignment = .center
        font = UIFont.italicSystemFont(ofSize: 24)
        //font = UIFont.boldSystemFont(ofSize: 24)
        //lineBreakMode = .byTruncatingHead
        
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.6
        
        numberOfLines = 0
    }


}







