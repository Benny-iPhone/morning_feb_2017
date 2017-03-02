//
//  FirstViewController.swift
//  UIVIewController_LifeCycle
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("first " + #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("first " + #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("first " + #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("first " + #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("first " + #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("first " + #function)
    }
    
    deinit {
        print("first " + #function)
    }
}

















