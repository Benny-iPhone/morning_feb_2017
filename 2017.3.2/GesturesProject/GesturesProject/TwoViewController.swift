//
//  TwoViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(backAction))
        swipeGesture.direction = .right
        
        self.view.addGestureRecognizer(swipeGesture)

        navigationItem.hidesBackButton = true
        
    }

    func backAction(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func unwindToTwo(_ segue : UIStoryboardSegue){
        
    }

}
