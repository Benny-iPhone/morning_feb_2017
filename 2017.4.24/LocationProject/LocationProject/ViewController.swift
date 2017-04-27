//
//  ViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func parseAction() {
        
        let location = AppManager.manager.locationManager.location
        
        location?.getAddress(with: { (placemark, error) in
            guard let placemark = placemark else{
                self.label.text = error?.localizedDescription
                return
            }
            
            let lines = placemark.addressDictionary?["FormattedAddressLines"] as? [String]
            self.label.text = lines?.joined(separator: "\n")
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .locationUpdated, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handleNotification(_ note : Notification){
        //note.name
        parseAction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







