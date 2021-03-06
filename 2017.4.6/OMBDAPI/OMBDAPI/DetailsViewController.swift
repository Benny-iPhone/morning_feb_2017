//
//  DetailsViewController.swift
//  OMBDAPI
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    var item : OMDBDetailedItem?
    
    @IBOutlet weak var plotTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationItem.title = item?.title
        title = item?.title
        
        plotTextView.text = item?.plot
        
        if let url = item?.poster,
            let imageView = self.view as? UIImageView{
            imageView.sd_setImage(with: url)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
