//
//  BranchDetailsViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import StoreKit

class BranchDetailsViewController: UIViewController {

    var branch : Branch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = branch.name
    }
    
    @IBAction func wazeAction(_ sender: Any) {
        //waze://?ll=xx,xx&navigate=yes
        //waze://?q=sfdf
        
        let latitude = branch.coordinate.latitude
        let longitude = branch.coordinate.longitude
        
        let urlString = "waze://?ll=\(latitude),\(longitude)&navigate=yes"
        guard let url = URL(string: urlString) else{
            return
        }
        
        if UIApplication.shared.canOpenURL(url) && false{
            UIApplication.shared.openURL(url)
            return
        }
        
        //go to app store to download waze
        let controller = SKStoreProductViewController()
        
        let params : [String:Any] = [
            SKStoreProductParameterITunesItemIdentifier:"323229106"
        ]
        
        controller.delegate = self
        controller.loadProduct(withParameters: params) { (success, err) in
            guard success else{
                return
            }
            
            self.present(controller, animated: true, completion: nil)
        }
        
    }

    

}

extension BranchDetailsViewController : SKStoreProductViewControllerDelegate{
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}









