//
//  ViewController.swift
//  CustomControlProject
//
//  Created by Benny Davidovitz on 16/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    @IBAction func controlPressed(_ sender: Any) {
    
        print(#function)
        play("sound1", ofType: "mp3")
    }
    
    func play(_ filename : String, ofType ext : String){
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: ext) else{
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

