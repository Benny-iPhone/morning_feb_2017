//
//  DBManager.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DBManager: NSObject {
    static let manager = DBManager()
    
    var rootRef : FIRDatabaseReference!
    var branchesRef : FIRDatabaseReference!
    
    override init() {
        rootRef = FIRDatabase.database().reference()
        branchesRef = rootRef.child("branches")
        
        super.init()
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





















