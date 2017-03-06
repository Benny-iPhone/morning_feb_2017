//
//  ColorCell.swift
//  DrawSomethingProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
    }
    
}
