//
//  Me.swift
//  FacebookIntergration
//
//  Created by Benny Davidovitz on 08/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class Me: NSObject {
    let id : String
    let firstname : String?
    let lastname : String?
    let picture : String?
    let cover : String?
    let gender : String?
    
    init(_ dict : [String:Any]) {
        
        self.id = dict["id"] as! String
        self.firstname = dict["first_name"] as? String
        self.lastname = dict["last_name"] as? String
        self.gender = dict["gender"] as? String
        
        if let pictureDict = dict["picture"] as? [String:Any],
        let data = pictureDict["data"] as? [String:Any],
            let urlString = data["url"] as? String {
            self.picture = urlString
        } else {
            self.picture = nil
        }
        
        if let coverDict = dict["cover"] as? [String:Any],
            let urlString = coverDict["source"] as? String {
            self.cover = urlString
        } else {
            self.cover = nil
        }
        
        super.init()
        
        
    }
}














