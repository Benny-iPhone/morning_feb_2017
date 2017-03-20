//
//  FirstViewController.swift
//  SegmentedChildProject
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var currentIndex = 0
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    //increment
    @IBAction func swipeLeftAction(_ sender: Any) {
        var index = segmentedControl.selectedSegmentIndex
        if index == segmentedControl.numberOfSegments - 1{
            index = 0
        } else {
            index += 1
        }
        
        segmentedControl.selectedSegmentIndex = index
        childSegmentAction(segmentedControl)
    }
    //decrement
    @IBAction func swipeRightAction(_ sender: Any) {
        var index = segmentedControl.selectedSegmentIndex
        
        if index == 0{
            index = segmentedControl.numberOfSegments - 1
        } else {
            index -= 1
        }
        
        segmentedControl.selectedSegmentIndex = index
        childSegmentAction(segmentedControl)
    }
    
    @IBAction func childSegmentAction(_ sender: UISegmentedControl) {
        var id = ""
        switch sender.selectedSegmentIndex {
        case 0:
            id = "Red"
        case 1:
            id = "Blue"
        case 2:
            id = "Green"
        default:
            return
        }
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: id) else{
            return
        }
        
        let isToRight = sender.selectedSegmentIndex > currentIndex
        
        //remove old
        if let oldVC = self.childViewControllers.first{
            remove(vc: oldVC, right: isToRight)
        }
        
        //present new
        display(vc: vc, right: isToRight)
        
        currentIndex = sender.selectedSegmentIndex
    }
    
    @IBOutlet weak var containerView: UIView!
    
    func display(vc : UIViewController, right : Bool){
        //make refernce to new view controller
        self.addChildViewController(vc)
        //add view
        var rect : CGRect = containerView.bounds
        rect.origin.x = right ? rect.width : -rect.width
        vc.view.frame = rect
        
        containerView.addSubview(vc.view)
        
        UIView.animate(withDuration: 0.7) { 
            vc.view.frame.origin.x = 0
        }
        
        //make ref from child to self as parent
        vc.didMove(toParentViewController: self)
    }
    
    func remove(vc : UIViewController, right : Bool){
        //make orphan
        vc.willMove(toParentViewController: nil)
        //remove view
        let width = containerView.bounds.width
        let x = right ? -width : width
        UIView.animate(withDuration: 0.7, animations: { 
            vc.view.frame.origin.x = x
        }) { (_) in
            vc.view.removeFromSuperview()
            //remove from children ref
            vc.removeFromParentViewController()
        }
        
        
    }
    


}












