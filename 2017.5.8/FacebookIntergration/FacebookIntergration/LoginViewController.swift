//
//  LoginViewController.swift
//  FacebookIntergration
//
//  Created by Benny Davidovitz on 08/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBAction func loginWithFacebookAction(_ sender: UIButton) {
        let manager = LoginManager()
        
        manager.logIn([.publicProfile, .email, .userFriends], viewController: self) { (result : LoginResult) in

            switch result{
            case .cancelled:
                debugPrint("cancelled")
            case .failed(let error):
                debugPrint("failed with error \(error)")
            case .success(grantedPermissions: _, declinedPermissions: _, token: let token):
                debugPrint("success")
                let credentials = FIRFacebookAuthProvider.credential(withAccessToken: token.authenticationToken)
                FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
                    
                    guard let _ = user else{
                        debugPrint(error)
                        return
                    }

                    debugPrint("login success")
                    FlowController.shared.determineRoot()

                })
                
                
                
            }

        }
        
    }
    

}
