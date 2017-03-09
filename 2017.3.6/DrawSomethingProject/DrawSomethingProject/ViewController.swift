//
//  ViewController.swift
//  DrawSomethingProject
//
//  Created by Benny Davidovitz on 06/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var colors : [UIColor] = []
    
    @IBOutlet weak var colorButton: UIBarButtonItem!

    @IBOutlet weak var undoButton: UIBarButtonItem!
    @IBOutlet weak var redoButton: UIBarButtonItem!
    
    @IBOutlet weak var toolbarBottomLayout: NSLayoutConstraint!
    @IBOutlet weak var drawView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawView.delegate = self
        
        refreshUndoRedoButtons()
        
        for i in stride(from: 0, to: 255, by: 25){
            for j in stride(from: 0, to: 255, by: 25){
                for k in stride(from: 0, to: 255, by: 25){
                    
                    let c = UIColor(red: CGFloat(i)/255, green: CGFloat(j)/255, blue: CGFloat(k)/255, alpha: 1)
                    colors.append(c)
                    
                }
            }
        }
    }
    
    func refreshUndoRedoButtons(){
        undoButton.isEnabled = drawView.canUndo
        redoButton.isEnabled = drawView.canRedo
    }
    
    @IBAction func clearAction(_ sender: Any) {
        drawView.clear()
        refreshUndoRedoButtons()
    }
    
    @IBAction func undoAction(_ sender: Any) {
        drawView.undo()
        refreshUndoRedoButtons()
    }
    
    @IBAction func redoAction(_ sender: Any) {
        drawView.redo()
        refreshUndoRedoButtons()
    }
    

    @IBAction func sliderAction(_ sender: UISlider) {
        drawView.lineWidth = CGFloat(sender.value)
    }

    @IBAction func shareAction(_ sender: Any) {
        
        let image = UIImage(view: drawView)
        
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
        
    }
    @IBAction func colorAction(_ sender: Any) {
        if toolbarBottomLayout.constant == 0{
            toolbarBottomLayout.constant = 88
        } else {
            toolbarBottomLayout.constant = 0
        }
        
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
        }
    }
}

extension ViewController : DrawViewDelegate{
    func drawView(_ drawView: DrawView, didStartPathAt point: CGPoint) {
        refreshUndoRedoButtons()
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorCell
        
        cell.view.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let c = colors[indexPath.item]
        colorButton.tintColor = c
        drawView.color = c
    }
}
























