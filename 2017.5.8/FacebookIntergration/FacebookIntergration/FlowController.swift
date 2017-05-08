//
//  FlowController.swift
//  FacebookIntergration
//
//  Created by Benny Davidovitz on 08/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookCore
import FirebaseAuth

class FlowController: NSObject {
    static let shared = FlowController()
    
    weak var window : UIWindow?
    
    func determineRoot(){
        
        let isLoggedIn = FIRAuth.auth()?.currentUser != nil
        
        let storyboardName = isLoggedIn ? "Main" : "Login"
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        window?.rootViewController = storyboard.instantiateInitialViewController()
        
        if let user = FIRAuth.auth()?.currentUser{
            debugPrint(user.displayName)
            debugPrint(user.email)
            debugPrint(user.photoURL)
        }
        
    }
}











