//
//  ViewController.swift
//  Radio
//
//  Created by Benny Davidovitz on 23/02/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var label: UILabel!
    
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        slider.sendActions(for: .valueChanged)
        
        try? AVAudioSession.sharedInstance().setActive(true)
        try? AVAudioSession.sharedInstance().setMode(AVAudioSessionCategoryPlayback)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let value = Int(sender.value * 100)
        label.text = "\(value) %"
        
        player?.volume = sender.value
    }
    
    @IBAction func playPauseAction(_ sender: UIButton) {
        
        if player == nil{
            
            UIView.animate(withDuration: 2, animations: { 
                self.view.backgroundColor = .lightGray
            })
            
            //play
            let urlString = "http://glzlv01.vds-is.bynetcdn.com/glglz/glglz_aac/playlist.m3u8"
            
            guard let url = URL(string: urlString) else{
                return
            }
            
            player = AVPlayer(url: url)
            player?.volume = slider.value
            player?.play()

            sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            //sender.setTitle("Pause", for: .normal)
            
        } else {
            
            UIView.animate(withDuration: 2, animations: { 
                self.view.backgroundColor = .white
            })
            
            //pause
            player?.pause()
            player = nil
            
            sender.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            //sender.setTitle("Play", for: .normal)
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}










