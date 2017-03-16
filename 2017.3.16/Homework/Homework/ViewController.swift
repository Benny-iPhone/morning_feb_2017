//
//  ViewController.swift
//  Homework
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var targetButton: UIButton!
    
    @IBAction func downloadAction(_ sender: Any) {
        guard let url = URL(string: "http://orig11.deviantart.net/2764/f/2014/167/0/0/ios_8_style_system_icon_for_os_x_by_rsood-d7mmvxx.png") else {
            return
        }
        
        
        targetButton.sd_setImage(with: url, for: .normal)
    }
    

}

