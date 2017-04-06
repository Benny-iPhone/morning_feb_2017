//
//  PostCell.swift
//  Board
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    @IBOutlet weak var label : UILabel!
    
    func configure(with post : [String:Any]){
        label.text = post["text"] as? String
    }
}
