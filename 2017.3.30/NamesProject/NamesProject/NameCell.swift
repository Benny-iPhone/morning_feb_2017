//
//  NameCell.swift
//  NamesProject
//
//  Created by Benny Davidovitz on 30/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    func configure(with info : String){
        label.text = info
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    

}
