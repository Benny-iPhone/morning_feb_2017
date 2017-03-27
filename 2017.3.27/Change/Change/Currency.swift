//
//  Currency.swift
//  Change
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class Currency: NSObject {
    let code : String
    let rate : Double
    
    init(code : String, rate : Double) {
        self.code = code
        self.rate = rate
        
        super.init()
    }
}
