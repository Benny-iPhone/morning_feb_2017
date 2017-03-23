//
//  FirstViewController.swift
//  SegmentedChildProject
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var currentIndex = 0{
        didSet{
            segmentedControl.selectedSegmentIndex = currentIndex
            pageControl.currentPage = currentIndex
        }
    }
    @IBOutlet weak var pageControl : UIPageControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    //increment
    @IBAction func swipeLeftAction(_ sender: Any) {
        var index = currentIndex
        if index == segmentedControl.numberOfSegments - 1{
            index = 0
        } else {
            index += 1
        }
        
        showPage(at: index, right: true)
    }
    //decrement
    @IBAction func swipeRightAction(_ sender: Any) {
        var index = currentIndex
        
        if index == 0{
            index = segmentedControl.numberOfSegments - 1
        } else {
            index -= 1
        }
        
        showPage(at: index, right: false)
    }
    
    @IBAction func childSegmentAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let isToRight = index > currentIndex
        showPage(at: index, right: isToRight)
    }
    
    @IBAction func pageControlAction(_ sender : UIPageControl){
        let index = sender.currentPage
        let isToRight = index > currentIndex
        showPage(at: index, right: isToRight)
    }
    
    func showPage(at index : Int, right : Bool){
        var id = ""
        switch index {
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
        
        
        //remove old
        if let oldVC = self.childViewControllers.first{
            remove(vc: oldVC, right: right)
        }
        
        //present new
        display(vc: vc, right: right)
        
        currentIndex = index
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












