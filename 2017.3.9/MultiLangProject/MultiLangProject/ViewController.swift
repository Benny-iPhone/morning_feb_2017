//
//  ViewController.swift
//  MultiLangProject
//
//  Created by Benny Davidovitz on 09/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = "hello_text".localized
        
        
    }

    @IBAction func playAudioAction(_ sender: Any) {
        
        guard let url = Bundle.main.url(forResource: "audio", withExtension: "mp3") else {
            return
        }
        
        let controller = AVPlayerViewController()
        controller.player = AVPlayer(url: url)
        
        self.present(controller, animated: true) { 
            controller.player?.play()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

