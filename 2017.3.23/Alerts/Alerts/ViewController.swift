//
//  ViewController.swift
//  Alerts
//
//  Created by hackeru on 23/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBAction func showAnnoyingAlert(_ sender: Any) {
        //UIAlertController
        //let appleId = 42
        
        let controller = UIAlertController(title: "Message in a bottle", message: "yo", preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "destructive", style: .destructive, handler: {
            print($0.title ?? "")
        }))

        
        let action = UIAlertAction(title: "default", style: .default) { a in
            print(a.title ?? "")
            guard let appleID = controller.textFields?.first?.text else{
                return
            }
            
            print(appleID)
        }
        
        controller.addAction(action)
        
        controller.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { _ in
            print("cancel handler")
        }))
        
        //add textfield
        controller.addTextField {
            $0.placeholder = "select date"
            //$0.inputView = UIDatePicker()
        }
        
        
        
        present(controller, animated: true, completion: nil)
        /*
        var arr = [1,2,3,0]
        arr.sort {
            $0 < $1
        }
        */
        
    }
   
    @IBAction func loginAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "login", message: nil, preferredStyle: .alert)
        
        //username
        alert.addTextField {
            $0.placeholder = "username"
            $0.textAlignment = .center
            
            $0.leftView = UIImageView(image: #imageLiteral(resourceName: "swipe"))
            $0.leftViewMode = .whileEditing
        }
        
        //password
        alert.addTextField {
            $0.placeholder = "password"
            $0.textAlignment = .center
            $0.isSecureTextEntry = true
        }
        
        //buttons
        alert.addAction(UIAlertAction(title: "later", style: .cancel, handler: nil))
        
        weak var weakSelf = self
        
        func loginHandler(_ action : UIAlertAction){
            let user = alert.textFields?.first?.text
            let pass = alert.textFields?.last?.text
            
            weakSelf?.serverValidation(user: user, password: pass)
        }
        
        alert.addAction(UIAlertAction(title: "login", style: .default, handler: loginHandler))
        
        alert.view.tintColor = .purple
        
        self.present(alert, animated: true, completion: nil)
        
    }

    func serverValidation(user : String?, password : String?){
        guard let user = user, let password = password else {
            print("no credintials typed")
            return
        }
        
        let url = "http://isecretary.co/api/login.php"
        let params : [String:Any] = [
            "username":user,
            "password":password
        ]
        
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            
            guard let json = response.result.value as? [String:Any] else{
                print(response.result.error ?? "")
                return
            }
            
            let reason = json["reason"] as? String ?? ""
            print(reason)
            
            if let code = json["code"] as? Int, code == 1{
                let data = json["data"] as? [String:Any]
                let firstname = data?["first_name"] as? String
                let lastname = data?["last_name"] as? String
                
                print((firstname ?? "") + " " + (lastname ?? ""))
            }
            
        }
        
    }
    
    
    func validate(user : String?, password : String?){
        guard let user = user, let password = password else {
            print("no credintials typed")
            return
        }
        
        if user == "user" && password == "P455W0RD"{
            print("login success")
        } else {
            print("wrong credentials")
        }
    }
    
}




















