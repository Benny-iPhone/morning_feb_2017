//
//  ViewController.swift
//  ImageFromServer
//
//  Created by Benny Davidovitz on 13/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func downloadAction(_ sender: UIButton) {
        
        SDImageCache.shared().clearMemory()
        SDImageCache.shared().clearDisk()
        SDImageCache.shared().cleanDisk()
        
        imageView.image = nil
        
        //validate url
        //let urlString = "http://www.golfholiday.com/media/memberimages/bayviewresort/BayViewontheBoardwalkMyrtleBeachGolf.jpg"
        let urlString = "https://media-cdn.tripadvisor.com/media/photo-o/03/07/64/d2/marina-bayview.jpg"
        guard let url = URL(string: urlString) else{
            return
        }
        
        //disable button
        sender.isEnabled = false
        indicatorView.startAnimating()
        
        //imageView.sd_setImage(with: url)
        imageView.sd_setImage(with: url) { (_, _, _, _) in
            sender.isEnabled = true
            self.indicatorView.stopAnimating()
        }
        
        /*
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            
            guard let data = data else{
                debugPrint(err!)
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
                sender.isEnabled = true
            }
            
        }.resume()
        */
        
        /*
        //go to background thread
        DispatchQueue.global().async {
            //download data
            var image : UIImage? = nil
            
            if let data = try? Data(contentsOf: url){
                debugPrint("finished download")
                //data to image
                image = UIImage(data: data)
            }

            DispatchQueue.main.async {
                //image to ui
                self.imageView.image = image
                //enable button
                sender.isEnabled = true

            }
        }
        */

    }


}










