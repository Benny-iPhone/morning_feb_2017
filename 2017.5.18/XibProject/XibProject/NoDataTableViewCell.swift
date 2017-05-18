//
//  NoDataTableViewCell.swift
//  XibProject
//
//  Created by Benny Davidovitz on 18/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class NoDataTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    class func nib() -> UINib{
        return UINib(nibName: "NoDataTableViewCell", bundle: .main)
    }
    
    class func reuseIdentifier() -> String{
        return "no_data_cell"
    }
    
    func configureWith(text : String){
        label.text = text
    }
    
}
