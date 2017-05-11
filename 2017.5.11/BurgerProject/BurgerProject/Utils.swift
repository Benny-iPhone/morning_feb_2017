//
//  Utils.swift
//  BurgerProject
//
//  Created by Benny Davidovitz on 11/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

extension UITabBarController{
    
    class func tabBarController() -> UITabBarController?{
        guard let window = UIApplication.shared.delegate?.window else{
            return nil
        }
        
        let appRoot =  window?.rootViewController as? UINavigationController
        let navRoot = appRoot?.viewControllers.first as? UITabBarController
        
        return navRoot
        
    }
    
}
