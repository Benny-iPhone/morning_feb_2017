//
//  ViewController.swift
//  ConnectionIndicator
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var connectionSwitch: UISwitch!
    
    let r : Reachability
    
    required init?(coder aDecoder: NSCoder) {
        r = Reachability.forInternetConnection()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        r.startNotifier()
        
        NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: nil, queue: .main) { (note) in
            //note.object as? Reachability
            self.updateSwitch()
        }
        
        updateSwitch()
    }

    func updateSwitch(){
        connectionSwitch.isOn = r.currentReachabilityStatus() != NotReachable
    }
    
    

}






