//
//  Room.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Room: NSObject {
    enum Key : String{
        case name = "name"
        case date = "date"
    }
    
    var name : String{
        didSet{
            ref.child(Key.name.rawValue).setValue(name)
        }
    }
    
    let date : Date
    let key : String
    
    var ref : FIRDatabaseReference{
        get{
            return DBManager.manager.roomsRef.child(key)
        }
    }
    
    var chatRef : FIRDatabaseReference{
        get{
            return DBManager.manager.rootRef.child("chat").child(key)
        }
    }
    
    init(key : String, val : [String:Any]) {
        self.key = key
        self.name = val[Key.name.rawValue] as! String
        let timestamp = val[Key.date.rawValue] as! TimeInterval
        self.date = Date(timeIntervalSince1970: timestamp)
        
        super.init()
    }
    
    
    
    func delete(){
        ref.removeValue()
        //remove all messages
        chatRef.removeValue()
    }
}














