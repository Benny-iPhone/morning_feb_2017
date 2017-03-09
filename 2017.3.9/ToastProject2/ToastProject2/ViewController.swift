//
//  ViewController.swift
//  ToastProject2
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {

    @IBAction func showSimpleToast(_ sender: Any) {
        
        //self.view.makeToast("Toast from cofix")
        self.view.makeToast("This is a piece of toast", duration: 3.0, position: .top)
        
        //self.view.makeToast("Bunch of text", duration: 3, position: .center, title: "Toast Title", image: #imageLiteral(resourceName: "toaster"), style: nil, completion: nil)
        
    }
    


}

