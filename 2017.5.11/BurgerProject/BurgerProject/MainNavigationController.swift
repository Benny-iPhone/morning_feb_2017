//
//  MainNavigationController.swift
//  BurgerProject
//
//  Created by Benny Davidovitz on 11/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import SideMenu

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let left = storyboard?.instantiateViewController(withIdentifier: "left") as? UISideMenuNavigationController
        left?.leftSide = true
        
        let right = storyboard?.instantiateViewController(withIdentifier: "right") as? UISideMenuNavigationController
        right?.leftSide = false
        
        SideMenuManager.menuLeftNavigationController = left
        SideMenuManager.menuRightNavigationController = right
        
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.view)
        
        SideMenuManager.menuFadeStatusBar = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
