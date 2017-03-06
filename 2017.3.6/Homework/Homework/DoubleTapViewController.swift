//
//  DoubleTapViewController.swift
//  Homework
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class DoubleTapViewController: UIViewController {

    var on : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        on = !on
        
        UIView.animate(withDuration: 1) { 
            sender.view?.backgroundColor = self.on ? .purple : .green
        }
        
        
        
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
