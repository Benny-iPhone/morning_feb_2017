//
//  AppManager.swift
//  Change
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Alamofire

class AppManager: NSObject {
    static let manager = AppManager()
    
    let baseURL = "https://api.fixer.io/latest"
    //typealias Matrix = [[Int]]
    typealias Completion = (_ arr : [Currency]) -> Void
    
    func getRates(with date : String? = nil, source : String? = nil, completion : @escaping Completion){

        var url = baseURL
        if let date = date, !date.isEmpty{
            url = url.replacingOccurrences(of: "latest", with: date)
        }
        
        var params : [String:Any] = [:]
        if let source = source, !source.isEmpty{
            params["base"] = source
        }
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (res) in
            
            guard let json = res.result.value as? [String:Any] else{
                completion([])
                return
            }
            
            let rates = json["rates"] as? [String:Double] ?? [:]
            var arr : [Currency] = []
            for (key,val) in rates{
                let c = Currency(code: key, rate: val)
                arr += [c]
            }
            
            completion(arr)
            
        }
        
    }
}
























