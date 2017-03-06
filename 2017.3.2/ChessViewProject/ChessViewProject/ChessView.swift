//
//  ChessView.swift
//  ChessViewProject
//
//  Created by Benny Davidovitz on 02/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ChessView: UIView {

    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        let size = min(bounds.width, bounds.height) / 8
        var rect = CGRect(x: 0, y: 0, width: size, height: size)
        
        for i in 0..<8{
            for j in 0..<8{
                
                if (i + j) % 2 == 0{
                    //black
                    addSubview(BlackView(frame: rect))
                } else {
                    //white
                    addSubview(WhiteView(frame: rect))
                }
                
                rect.origin.x += size
                
            }//end of line
            
            //new line
            rect.origin.x = 0
            rect.origin.y += size
        }
    }


}





































