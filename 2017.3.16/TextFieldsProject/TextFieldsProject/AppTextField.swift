//
//  AppTextField.swift
//  TextFieldsProject
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class AppTextField: UITextField {

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
        backgroundColor = .white
        textColor = .black
        clearButtonMode = .whileEditing
        font = UIFont(name: "IndieFlower", size: 20)//UIFont.boldSystemFont(ofSize: 20)
        
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        textAlignment = .center
        
    }
    
    override func becomeFirstResponder() -> Bool {
        backgroundColor = .yellow
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        backgroundColor = .white
        return super.resignFirstResponder()
    }


}















