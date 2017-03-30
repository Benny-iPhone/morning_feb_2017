//
//  Meal.swift
//  Menu
//
//  Created by Benny Davidovitz on 30/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class Meal: NSObject {
    let name : String
    let calories : Int
    let price : Double
    let imageUrl : URL?
    let desc : String?
    
    init(_ dict : [String:Any]) {
        
        name = dict["name"] as? String ?? ""
        calories = dict["calories"] as? Int ?? 0
        price = dict["price"] as? Double ?? 0
        
        if let urlString = dict["image"] as? String{
            imageUrl = URL(string: urlString)
        } else {
            imageUrl = nil
        }
        
        desc = dict["desc"] as? String
        
        super.init()
    }
    
    class func readFile() -> [Meal]
    {
        guard let path = Bundle.main.path(forResource: "menu", ofType: "plist") else{
            debugPrint("no file")
            return []
        }
        
        guard let arr = NSArray(contentsOfFile: path) else{
            debugPrint("file is not an array")
            return []
        }
        
         //                         Array<Dictionary<String,Any>>
        guard let dictArr = arr as? [[String:Any]] else{
            debugPrint("array has wrong format")
            return []
        }
        
        var finalArray : [Meal] = []
        
        for dict in dictArr{
            let m = Meal(dict)
            finalArray.append(m)
        }
        
        return finalArray
        
        
    }
}














