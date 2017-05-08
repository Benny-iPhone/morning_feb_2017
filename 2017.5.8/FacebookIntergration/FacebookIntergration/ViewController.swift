//
//  ViewController.swift
//  FacebookIntergration
//
//  Created by Benny Davidovitz on 08/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var firstnameLabel: UILabel!
    
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pictureImageView.layer.cornerRadius = 50
        pictureImageView.layer.masksToBounds = true
        pictureImageView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        pictureImageView.layer.borderWidth = 1
        
        FacebookManager.shared.fetchMe { (me) in
            self.firstnameLabel.text = me?.firstname
            self.lastnameLabel.text = me?.lastname
            self.genderLabel.text = me?.gender
            
            if let urlString = me?.cover, let url = URL(string: urlString){
                self.coverImageView.sd_setImage(with: url)
            }
            
            if let urlString = me?.picture, let url = URL(string: urlString){
                self.pictureImageView.sd_setImage(with: url)
            }
        }
        
        /*
        if let _ = AccessToken.current{
            debugPrint("logged in")
        } else {
            debugPrint("not logged in")
        }
        
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)*/
    }

    
    
    @IBAction func getFriendsAction(_ sender: Any) {
        FacebookManager.shared.fetchFriends()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

