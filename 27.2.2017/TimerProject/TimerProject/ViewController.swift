//
//  ViewController.swift
//  TimerProject
//
//  Created by Benny Davidovitz on 27/02/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var interval : TimeInterval// = 0.05
    var duration : TimeInterval// = 2
    
    var timer : Timer?
    
    required init?(coder aDecoder: NSCoder) {
        interval = 0.05
        duration = 2
        super.init(coder: aDecoder)
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(rotate), userInfo: nil, repeats: true)
        } else {
            timer?.invalidate()
            self.timer = nil
        }
        //sender.isEnabled = false
    }
    
    func rotate(){
        let angle = CGFloat((2 * M_PI) / (duration / interval))
        let t = CGAffineTransform(rotationAngle: angle)
        let totalT = imageView.transform.concatenating(t)
        
        imageView.transform = totalT
    }

}
























