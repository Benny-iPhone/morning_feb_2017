//
//  MealCell.swift
//  Menu
//
//  Created by Benny Davidovitz on 30/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mealImageView.layer.cornerRadius = 40
        mealImageView.layer.masksToBounds = true
    }
    
    func configure(with meal : Meal){
        nameLabel.text = meal.name
        caloriesLabel.text = "\(meal.calories)"
        
        if let url = meal.imageUrl{
            mealImageView.sd_setImage(with: url)
        } else {
            mealImageView.sd_cancelCurrentAnimationImagesLoad()
            mealImageView.image = nil
        }
        
    }

}














