//
//  APIManager.swift
//  OMBDAPI
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    static let manager = APIManager()
    
    let baseURL = "https://www.omdbapi.com/"
    
    func search(term : String, at page : Int = 1,type : String? = nil, callback : @escaping ([OMDBItem],String?)->Void){
        
        var params : [String:Any] = [
            "s":term,
            "page":page
        ]
        
        if let type = type{
            params["type"] = type
        }
        
        Alamofire.request(baseURL, method: .get, parameters: params).responseJSON { (response) in
            guard let JSON = response.result.value as? [String:Any] else{
                callback([],response.result.error?.localizedDescription)
                return
            }
            
            guard let dictArray = JSON["Search"] as? [[String:Any]] else{
                let msg = JSON["Error"] as? String
                callback([],msg)
                return
            }
            
            var finalArray : [OMDBItem] = []
            
            for dict in dictArray{
                if let obj = OMDBItem(dict){
                    finalArray.append(obj)
                }
            }
            
            callback(finalArray, JSON["totalResults"] as? String)
        }
    }


    func getDetails(of id : String,
                    callback : @escaping (OMDBDetailedItem?,String?)->Void)
    {
    
        Alamofire.request(baseURL, method: .get, parameters: ["i":id]).responseJSON { (response) in
            
            guard let JSON = response.result.value as? [String:Any] else{
                callback(nil,response.result.error?.localizedDescription)
                return
            }
            
            guard let str = JSON["Response"] as? String, str == "True" else{
                let msg = JSON["Error"] as? String
                callback(nil,msg)
                return
            }
            
            let obj = OMDBDetailedItem(JSON)
            
            callback(obj,nil)
            
        }
        
    }
}


















