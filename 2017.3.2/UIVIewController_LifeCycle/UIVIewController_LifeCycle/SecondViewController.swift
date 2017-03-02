//
//  SecondViewController.swift
//  UIVIewController_LifeCycle
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("second " + #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("second " + #function)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("second " + #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("second " + #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("second " + #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("second " + #function)
    }
    
    deinit {
        print("second " + #function)
    }


}


















