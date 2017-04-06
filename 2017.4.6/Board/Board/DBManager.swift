//
//  DBManager.swift
//  Board
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase

class DBManager: NSObject {
    static let manager = DBManager()
    
    var ref: FIRDatabaseReference!
    var postRef : FIRDatabaseReference!
    
    override init() {
        super.init()
        
        ref = FIRDatabase.database().reference()
        postRef = ref.child("post")
    }
    
    func createPost(with text : String){
        postRef.childByAutoId().setValue(["text":text])
    }
    
    func newPostObserve(completion : @escaping ([String:Any])->Void){
        
        postRef.observe(FIRDataEventType.childAdded, with: {
            guard let val = $0.value as? [String:Any] else{
                return
            }
            
            completion(val)
        })
        
    }
    
    func dbTest(){
        let post : [String : Any] = [
            "text":"wrote by benny",
            "date":Date().timeIntervalSince1970
        ]
        
        ref.child("test").childByAutoId().setValue(post)
    }
    
}














