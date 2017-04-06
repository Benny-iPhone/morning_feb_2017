//
//  OMDBDetailedItem.swift
//  OMBDAPI
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class OMDBDetailedItem: OMDBItem {
    let plot : String?
    
    override init?(_ dict: [String : Any]) {
        self.plot = dict["Plot"] as? String
        
        super.init(dict)
    }
}
