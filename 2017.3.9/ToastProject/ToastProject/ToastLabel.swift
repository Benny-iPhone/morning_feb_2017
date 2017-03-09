//
//  ToastLabel.swift
//  ToastProject
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

extension String{
    func toast(){
        ToastLabel.toast(text: self)
    }
}

class ToastLabel: UILabel {

    enum Position{
        case top,center, bottom
        
        func y() -> CGFloat{
            switch self {
            case .top: return 0.2
            case .center: return 0.5
            case .bottom: return 0.8
            }
        }
    }
    
    class func toast(text : String,
                     on view : UIView? = nil,
                     duration : TimeInterval = 1.5,
                     position : Position = .top){

        let window = UIApplication.shared.delegate!.window!!
        let parentView = view != nil ? view! : window
        
        //create label
        var rect : CGRect = parentView.bounds
        rect.size.width *= 0.6
        rect.size.height *= 0.1
        
        let p = CGPoint(x: parentView.bounds.width * 0.5,
                        y: parentView.bounds.height * position.y())
        
        let label = ToastLabel(frame: rect)
        label.center = p
        label.text = text
        
        //display
        label.alpha = 0
        parentView.addSubview(label)
        
        //animation
        func fadeIn(){
            label.alpha = 1
        }
        
        func fadeOut(){
            label.alpha = 0
        }
        
        UIView.animate(withDuration: duration, animations: fadeIn) { _ in
            
            UIView.animate(withDuration: duration, animations: fadeOut, completion: { _ in
                label.removeFromSuperview()
            })
            
        }
        
    }
    
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
    
    //http://stackoverflow.com/questions/32239457/how-do-you-add-inset-to-uilabel-ios-swift
    let topInset : CGFloat = 0
    let bottomInset : CGFloat = 0
    let leftInset : CGFloat = 4
    let rightInset : CGFloat = 4
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override public var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
    
    private func setup(){
        backgroundColor = .black
        textColor = .white
        textAlignment = .center
        
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        
        font = UIFont.boldSystemFont(ofSize: 24)
        
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
    }


}





















