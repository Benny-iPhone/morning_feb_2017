//
//  ViewController.swift
//  ViewProject
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var rect = CGRect(x: 20, y: 20, width: 100, height: 30)
        let firstView = BlueView(frame: rect)
        
        //firstView.backgroundColor = .magenta
        
        view.addSubview(firstView)
        
        rect.origin.y += rect.size.height
        
        let label = UILabel(frame: rect)
        label.text = "hello 😀"
        label.backgroundColor = .purple
        label.textColor = .white
        label.textAlignment = .center
        
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




















