//
//  Message.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class Message: JSQMessage {
    
    enum Key : String{
        case text = "text"
        case date = "date"
        case uid = "uid"
        case name = "name"
    }
    
    let key : String
    init(key : String, val : [String:Any]) {
        self.key = key
        
        let text = val[Key.text.rawValue] as! String
        let timestamp = val[Key.date.rawValue] as! TimeInterval
        let date = Date(timeIntervalSince1970: timestamp)
        let name = val[Key.name.rawValue] as! String
        let uid = val[Key.uid.rawValue] as! String
        
        super.init(senderId: uid, senderDisplayName: name, date: date, text: text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}









