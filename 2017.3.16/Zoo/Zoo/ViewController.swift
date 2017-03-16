//
//  ViewController.swift
//  Zoo
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Sound : Int{
        case dog = 1, horse, alpaca, cat,trex
        
        func filename() -> String{
            switch self {
            case .dog: return "dog"
            case .horse: return "horse"
            case .alpaca: return "alpaca"
            case .cat: return "cat"
            case .trex: return "trex"
            }
        }
    }
    
    var player : AVAudioPlayer?
    weak var playingButton : UIButton?

    @IBAction func makeSoundAction(_ sender: UIButton) {
        //pause if same button pressed while playing
        guard playingButton != sender else {
            sender.setImage(nil, for: .normal)
            player?.pause()
            player = nil
            playingButton = nil
            return
        }
        
        //play
        
        guard let sound = Sound(rawValue: sender.tag) else{
            print("tag \(sender.tag) is undefined")
            return
        }
        
        //setup player
        guard let url = Bundle.main.url(forResource: sound.filename(), withExtension: "mp3") else {
            print("file \(sound.filename()).mp3 not found")
            return
        }
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.delegate = self
        player?.play()
        
        //refresh playing indication
        
        //clear old
        playingButton?.setImage(nil, for: .normal)
        
        //show on new
        playingButton = sender
        sender.setImage(#imageLiteral(resourceName: "musical"), for: .normal)
        
        
    }

}

extension ViewController : AVAudioPlayerDelegate{
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playingButton?.setImage(nil, for: .normal)
        playingButton = nil
    }
}























