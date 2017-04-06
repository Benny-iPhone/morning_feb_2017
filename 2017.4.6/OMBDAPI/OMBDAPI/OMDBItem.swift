//
//  OMDBItem.swift
//  OMBDAPI
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class OMDBItem: NSObject {
    let imdbID : String

    let title : String?
    let year : String?
    let type : String?
    let poster : URL?
    
    init?(_ dict : [String:Any]) {
        guard let imdbID = dict["imdbID"] as? String else {
            return nil
        }
        
        self.imdbID = imdbID
        self.title = dict["Title"] as? String
        self.year = dict["Year"] as? String
        self.type = dict["Type"] as? String
        
        if let urlString = dict["Poster"] as? String{
            self.poster = URL(string: urlString)
        } else {
            self.poster = nil
        }
        
        super.init()
    }
}
















