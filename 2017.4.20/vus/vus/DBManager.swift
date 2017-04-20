//
//  DBManager.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import JSQMessagesViewController

class DBManager: NSObject {
    static let manager = DBManager()
    
    var rootRef : FIRDatabaseReference!
    var branchesRef : FIRDatabaseReference!
    var roomsRef : FIRDatabaseReference!
    
    var username : String{
        get{
            return FIRAuth.auth()?.currentUser?.displayName ?? ""
        }
    }
    
    var uid : String?{
        get{
            return FIRAuth.auth()?.currentUser?.uid
        }
    }
    
    override init() {
        rootRef = FIRDatabase.database().reference()
        branchesRef = rootRef.child("branches")
        roomsRef = rootRef.child("rooms")
        
        super.init()
    }
    
    func createRoom(with name : String){
        roomsRef.childByAutoId().setValue([
            Room.Key.name.rawValue:name,
            Room.Key.date.rawValue:Date().timeIntervalSince1970
            ])
        
    }
    
    func observeRooms(with handler : @escaping (Room)->Void){
        
        roomsRef.removeAllObservers()
        
        roomsRef.observe(.childAdded, with: {
            guard let val = $0.value as? [String:Any] else{
                return
            }
            
            let r = Room(key: $0.key, val: val)
            handler(r)
        })
        
    }
    
    func addMessage(text : String, to room : Room){
        
        guard let uid = uid else {
            return
        }
        
        let msg : [String:Any] = [
            Message.Key.name.rawValue:username,
            Message.Key.uid.rawValue:uid,
            Message.Key.text.rawValue:text,
            Message.Key.date.rawValue:Date().timeIntervalSince1970
        ]
        
        room.chatRef.childByAutoId().setValue(msg)
        
    }
    
    func readMessages(in room : Room, completion : @escaping ([Message])->Void){
        room.chatRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value as? [String:[String:Any]] else{
                return
            }
            
            var finalArray : [Message] = []
            
            for (key,val) in value{
                finalArray.append(Message(key: key, val: val))
            }
            
            finalArray.sort(by: { (msg1, msg2) -> Bool in
                return msg1.date.timeIntervalSince1970 < msg2.date.timeIntervalSince1970
            })
            
            completion(finalArray)
        })
    }
    
    func observeMessages(in room : Room, since : Date, handler : @escaping (Message)->Void){
        
        //room.chatRef.removeAllObservers()
        
        let q = room.chatRef.queryOrdered(byChild: Message.Key.date.rawValue).queryStarting(atValue: since.timeIntervalSince1970)
        
        q.observe(.childAdded, with: { (snapshot) in
            guard let val = snapshot.value as? [String:Any] else{
                return
            }
            
            let msg = Message(key: snapshot.key, val: val)
            handler(msg)
        })
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func addBranch(name : String, lat : Double, lon : Double, phone : String){
        
        let branch : [String:Any] = [
            "name":name,
            "lat":lat,
            "lon":lon,
            "phone":phone
        ]
        
        branchesRef.childByAutoId().setValue(branch)
        
    }
    
    func readAllBranches(with completion : @escaping (String)->Void){
        
        branchesRef.removeAllObservers()
        
        branchesRef.observe(.childAdded, with: { (snapshot) in
            
            guard let val = snapshot.value as? [String:Any] else{
                return
            }
            
            let name = val["name"] as? String ?? ""
            completion(name)
            
            print(val)
            print(snapshot.key)
            
        })
        
    }
    
    
}





















