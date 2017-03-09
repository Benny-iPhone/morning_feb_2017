//
//  DrawView.swift
//  DrawSomethingProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

protocol DrawViewDelegate {
    func drawView(_ drawView : DrawView, didStartPathAt point : CGPoint)
}

class DrawView: UIView {
    
    //MARK: - Public -
    var delegate : DrawViewDelegate?
    
    var lineWidth : CGFloat = 1
    var color : UIColor?
    var canUndo : Bool{
        get{
            return beziers.count > 0
        }
    }
    
    var canRedo : Bool{
        get{
            return redoBeziers.isEmpty == false
        }
    }
    
    func clear(){
        //bezier = UIBezierPath()
        //bezier.removeAllPoints()
        beziers = []
        redoBeziers = []
        setNeedsDisplay()
    }
    
    func undo(){
        guard beziers.isEmpty == false else {
            return
        }
        
        let oldB = beziers.removeLast()
        redoBeziers.append(oldB)
        
        setNeedsDisplay()
    }
    
    func redo(){
        guard redoBeziers.isEmpty == false else {
            return
        }
        
        let b = redoBeziers.removeLast()
        beziers.append(b)
        
        setNeedsDisplay()
    }
    
    //MARK: - Internal -
    
    private var redoBeziers : [ColorBezierPath] = []
    private var beziers : [ColorBezierPath] = []
    
    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setup(){
        self.isMultipleTouchEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        //clear redo array if started new path
        if !redoBeziers.isEmpty{
            redoBeziers = []
        }
        
        //create new path
        let p = touches.first!.location(in: self)
        //bezier.move(to: p)
        let b = ColorBezierPath()
        b.lineWidth = lineWidth
        b.color = color
        b.move(to: p)
        
        beziers.append(b)
        
        delegate?.drawView(self, didStartPathAt: p)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let p = touches.first!.location(in: self)
        //bezier.addLine(to: p)
        let b = beziers.last
        b?.addLine(to: p)
        
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        for b in beziers{
            b.stroke()
        }
        //bezier.stroke()
        
    }
    
    
}




















