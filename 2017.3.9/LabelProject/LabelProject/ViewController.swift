//
//  ViewController.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var attLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textLabel = CustomLabel(frame: CGRect(x: 0, y: 22, width: self.view.bounds.width, height: 60))
        //textLabel.textColor = .purple
        textLabel.text = "hello label 🤡 hello label 🤡 hello label 🤡 hello label 🤡 hello label 🤡 hello label 🤡 hello label 🤡 hello label 🤡"
        
        view.addSubview(textLabel)
        
        
        configAttLabel()
    }
    
    func configAttLabel(){
        guard let text = attLabel.text, !text.isEmpty else{
            return
        }
        
        let atts : [String:Any] = [
            NSUnderlineStyleAttributeName:NSUnderlineStyle.styleSingle.rawValue,
            NSStrokeColorAttributeName:UIColor.black,
            NSStrokeWidthAttributeName:3,
            NSBackgroundColorAttributeName:UIColor.magenta.withAlphaComponent(0.3)
        ]
        let attString = NSMutableAttributedString(string: text, attributes: atts)

        let spaceRange = (text as NSString).range(of: " ")
        guard spaceRange.length != 0 else {
            attLabel.attributedText = attString
            return
        }
        
        let leftRange = NSRange(location: 0, length: spaceRange.location)
        let afterSpace = spaceRange.location + spaceRange.length
        let rightRange = NSRange(location: afterSpace, length: (text as NSString).length - afterSpace)
        
        attString.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 50), range: leftRange)
        attString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 20), range: rightRange)
        
        attLabel.attributedText = attString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}










