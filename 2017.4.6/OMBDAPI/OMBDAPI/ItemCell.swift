//
//  ItemCell.swift
//  OMBDAPI
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ItemCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func configure(with item : OMDBItem){
        let fullName = (item.title ?? "") + " (" + (item.type ?? "") + ")"
        
        nameLabel.text = fullName
        yearLabel.text = item.year
        if let url = item.poster{
            posterImageView.sd_setImage(with: url)
        } else {
            posterImageView.sd_cancelCurrentImageLoad()
            posterImageView.image = nil
        }
        
    }

}












