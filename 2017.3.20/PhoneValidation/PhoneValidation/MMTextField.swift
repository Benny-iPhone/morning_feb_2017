//
//  MMTextField.swift
//  PhoneValidation
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class MMTextField: UITextField {

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
    
    func setup(){
        //let width = UIScreen.main.bounds.width
        let width = UIApplication.shared.delegate!.window!!.bounds.width
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        
        toolbar.items = [spaceButton,doneButton]
        
        self.inputAccessoryView = toolbar
        
    }
    
    func doneAction(){
        self.sendActions(for: .editingDidEndOnExit)
    }


}

















