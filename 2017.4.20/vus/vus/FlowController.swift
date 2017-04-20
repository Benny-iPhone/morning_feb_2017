//
//  FlowController.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FirebaseAuth

class FlowController: NSObject {
    static let shared = FlowController()
    
    weak var window : UIWindow?
    
    func determineRoot(){
        let storyboardName = FIRAuth.auth()?.currentUser == nil ? "Login" : "Chat"
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        let rootVC = storyboard.instantiateInitialViewController()
        
        window?.rootViewController = rootVC
        
    }
}











