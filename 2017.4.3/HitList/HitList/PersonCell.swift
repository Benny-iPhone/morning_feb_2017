//
//  PersonCell.swift
//  HitList
//
//  Created by hackeru on 03/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

protocol PersonCellDelegate{
    func personCell(_ cell : PersonCell, didChangeIsAlive isAlive : Bool)
    func personCellImageDidTap(_ cell : PersonCell)
}

class PersonCell: UITableViewCell {
    var delegate : PersonCellDelegate?

    @IBOutlet weak var profileImageViewHeightLayout: NSLayoutConstraint!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var aliveSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageViewHeightLayout.constant * 0.5
        profileImageView.layer.masksToBounds = true
        
        profileImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    func configure(with person : Person){
        
        let isAlive = person.isAlive
        
        firstnameLabel.text = person.firstname
        lastnameLabel.text = person.lastname
        aliveSwitch.isOn = isAlive
        
        firstnameLabel.textColor = isAlive ? .black : .lightGray
        lastnameLabel.textColor = isAlive ? .black : .lightGray
        
        if let name = person.imageName{
            Filer.filer.readAsync(filename: name, fileExt: "jpeg", completion: { (data) in
                guard let data = data else{
                    self.profileImageView.image = #imageLiteral(resourceName: "avatar")
                    return
                }
                
                self.profileImageView.image = UIImage(data: data)
            })
        } else{
            self.profileImageView.image = #imageLiteral(resourceName: "avatar")
        }
        
        /*
        if let name = person.imageName,
            let data = Filer.filer.read(filename: name, fileExt: "jpeg"),
            let image = UIImage(data: data){
            profileImageView.image = image
        } else {
            profileImageView.image = #imageLiteral(resourceName: "avatar")
        }*/
        
    }
    
    func tapAction(){
        delegate?.personCellImageDidTap(self)
    }
    
    @IBAction func aliveSwitchAction(_ sender: UISwitch) {
        delegate?.personCell(self, didChangeIsAlive: sender.isOn)
    }
}












