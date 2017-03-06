//
//  ColorBezierPath.swift
//  DrawSomethingProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ColorBezierPath: UIBezierPath {
    var color : UIColor?
    
    override func stroke() {
        color?.setStroke()
        super.stroke()
    }
}
