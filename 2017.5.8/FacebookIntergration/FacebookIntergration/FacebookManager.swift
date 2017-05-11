//
//  FacebookManager.swift
//  FacebookIntergration
//
//  Created by Benny Davidovitz on 08/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookCore

class FacebookManager: NSObject {
    static let shared = FacebookManager()
    
    
    
    func fetchMe(with completion : @escaping (Me?)->Void){
        let connection = GraphRequestConnection()
        
        var request = GraphRequest(graphPath: "/me")
        request.parameters = ["fields":"id,first_name,last_name,email,gender,cover,picture.type(large)"]
        
        connection.add(request) { (httpResponse, result) in
            switch result{
            case .failed(let error):
                debugPrint(error)
                completion(nil)
                
            case .success(response: let response):
                debugPrint(response.dictionaryValue ?? "")
                
                guard let dict = response.dictionaryValue else{
                    completion(nil)
                    return
                }
                
                let me = Me(dict)
                completion(me)
            }
        }
        
        connection.start()
        
    }
    
    func fetchFriends(){
        
        let connection = GraphRequestConnection()
        
        var request = GraphRequest(graphPath: "/me/taggable_friends")
        request.parameters = [
            "fields":"id,name,birthday",
            "limit":10
            //"after":"your_retrived_after_key"
        ]
        
        
        connection.add(request) { (_, result) in
            switch result{
            case .failed(let error):
                debugPrint(error)
            case .success(response: let response):
                debugPrint(response)
                
                let firstId = (response.dictionaryValue!["data"] as! [[String:Any]]).first!["id"] as! String
                self.requestBirthdayFor(userid: firstId)
                
                
            }
        }
        
        connection.start()
    }
    
    func requestBirthdayFor(userid : String){
        let connection = GraphRequestConnection()
        
        var request = GraphRequest(graphPath: "/\(userid)/")
        request.parameters = ["fields":"id,name,birthday"]
        
        connection.add(request) { (_, result) in
            switch result{
            case .failed(let error):
                debugPrint(error)
            case .success(response: let response):
                debugPrint(response)
                
                
                
            }
        }
        
        connection.start()
    }
    
}







