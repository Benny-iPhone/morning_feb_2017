//
//  Utils.swift
//  MultiLangProject
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import Foundation
import UIKit

extension String{
    var localized : String{
        get{
            return NSLocalizedString(self, comment: self)
        }
    }
}

class AppLabel : UILabel{
    @IBInspectable var localizedString : String = ""{
        didSet{
            self.text = localizedString.localized
        }
    }
}












