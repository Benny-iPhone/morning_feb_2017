//
//  ViewController.swift
//  SlotMachine
//
//  Created by hackeru on 27/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var spinButton: UIButton!
    
    var player : AVAudioPlayer?
    
    let images = [#imageLiteral(resourceName: "apple"),#imageLiteral(resourceName: "bar"),#imageLiteral(resourceName: "crown"),#imageLiteral(resourceName: "lemon"),#imageLiteral(resourceName: "seven"),#imageLiteral(resourceName: "cherry")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self

    }
    
    func roll(){
        var delay : TimeInterval = 0
        for i in 0..<pickerView.numberOfComponents{
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { 
                self.randomSelectRow(in: i)
            })
            
            delay += 0.25
        }
    }
    
    func randomSelectRow(in comp : Int){
        let r = Int(arc4random_uniform(UInt32(8 * images.count))) + images.count
        pickerView.selectRow(r, inComponent: comp, animated: true)
    }
    
    func checkWin(){
        
        var lastRow = -1
        var counter = 0
        for i in 0..<pickerView.numberOfComponents{
            let row = pickerView.selectedRow(inComponent: i) % images.count
            if lastRow == row{
                counter += 1
            } else {
                lastRow = row
                counter = 1
            }
        }
        
        if counter == 3{
            //win
            label.text = "WIN"
            play(sound: "win")
        } else {
            //loose
            label.text = "TRY AGAIN"
        }
        
    }
    
    func play(sound name : String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            return
        }
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    @IBAction func spinAction(_ sender: UIButton) {
        play(sound: "crunch")
        sender.isEnabled = false
        roll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { 
            self.checkWin()
            sender.isEnabled = true
        }
    }
    

    //MARK: - UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % images.count
        return UIImageView(image: images[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return images[0].size.height
    }


}








