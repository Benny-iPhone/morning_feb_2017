//
//  ViewController.swift
//  FILER
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveAction(_ sender: Any) {
        guard let text = textField.text else {
            return
        }
        
        guard let data = text.data(using: .utf8) else {
            return
        }
        
        Filer.shared.save(data: data, name: "myTextFile", ext: "txt")
    }
    
    @IBAction func readAction(_ sender: Any) {
        guard let data = Filer.shared.readData(by: "myTextFile", ext: "txt") else{
            return
        }
        
        let str = String(data: data, encoding: .utf8)
        textField.text = str
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        
        Filer.shared.removeData(by: "myTextFile", ext: "txt")
        
    }
    
    @IBAction func saveAudioAction(_ sender: Any) {
        let urlString = "http://soundbible.com/grab.php?id=2185&type=mp3"
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                debugPrint(error)
                return
            }
            
            guard let data = data else{
                return
            }
            
            Filer.shared.save(data: data, name: "my_audio", ext: "mp3")
            
        }.resume()
        
        URLSession.shared.downloadTask(with: url) { (locationURL, response, error) in
            if let error = error{
                debugPrint(error)
                return
            }
            
            guard let locationURL = locationURL else{
                return
            }
            
            let path = Filer.shared.documentsDir + "/" + "my_audio_2.mp3"
            let targetURL = URL(fileURLWithPath: path)
            
            do{
            try FileManager.default.moveItem(at: locationURL, to: targetURL)
            try FileManager.default.removeItem(at: locationURL)
            } catch {
                debugPrint(error)
            }
            
        }.resume()
    }
    
    var player : AVAudioPlayer?
    
    @IBAction func playAudioFileAction(_ sender: Any) {
        guard let data = Filer.shared.readData(by: "my_audio", ext: "mp3") else {
            return
        }
        
        player = try? AVAudioPlayer(data: data)
        player?.play()
    }
    
    
    @IBAction func saveJsonAction(_ sender: Any) {
        let urlString = "http://www.mycurrency.net/service/rates"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                debugPrint(error ?? "")
                return
            }
            
            Filer.shared.save(data: data, name: "currency", ext: "json")
        }.resume()
    }
    
    @IBAction func readJsonAction(_ sender: Any) {
        guard let data = Filer.shared.readData(by: "currency", ext: "json") else {
            return
        }
        
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else{
            return
        }
        
        debugPrint(obj)
        
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

